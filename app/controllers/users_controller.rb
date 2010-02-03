class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  skip_before_filter :verify_authenticity_token, :only => :changed_on_spreedly
  
  # remove this
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @plans = RSpreedly::SubscriptionPlan.all.sort_by{|plan| plan.price }
  end

  def create
    @user = User.new(params[:user])
    @plans = RSpreedly::SubscriptionPlan.all
    plan = @plans.select{ |plan| plan.feature_level == @user.requested_feature_level }.first
    if @user.save
      subscriber = RSpreedly::Subscriber.new(:email => @user.email)
      subscriber.create
      flash.now[:notice] = "Account registered!"
      redirect_to @user.upgrade_url(plan)
    else
      render :action => :new
    end
  end

  def show
    @user = params[:id].nil? ? @current_user : User.find(params[:id]) # only for development
    
    @user.feature_level.blank? && @user.subscription_record && @user.update_attribute(:feature_level, @user.subscription_record.feature_level)
      
    @subscriber = @user.subscription_record || RSpreedly::Subscriber.new
    @plans = RSpreedly::SubscriptionPlan.all.sort_by{|plan| plan.price }
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def changed_on_spreedly
    respond_to do |format|
      format.xml {
        subscriber_ids = (params[:subscriber_ids] || '').split(",")
        subscriber_ids.each do | each |
          user = User.find_by_id(each)
          user.refresh_from_spreedly if user
        end
        head(:ok)
      }
    end
  end
end