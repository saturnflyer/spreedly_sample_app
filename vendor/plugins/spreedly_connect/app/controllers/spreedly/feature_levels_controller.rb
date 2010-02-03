class Spreedly::FeatureLevelsController < ApplicationController
  def index
    @feature_levels = FeatureLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feature_levels }
    end
  end

  def show
    @feature_level = FeatureLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feature_level }
    end
  end

  def new
    @feature_level = FeatureLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feature_level }
    end
  end

  def edit
    @feature_level = FeatureLevel.find(params[:id])
  end

  def create
    @feature_level = FeatureLevel.new(params[:feature_level])

    respond_to do |format|
      if @feature_level.save
        flash[:notice] = 'FeatureLevel was successfully created.'
        format.html { redirect_to(@feature_level) }
        format.xml  { render :xml => @feature_level, :status => :created, :location => @feature_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @feature_level = FeatureLevel.find(params[:id])

    respond_to do |format|
      if @feature_level.update_attributes(params[:feature_level])
        flash[:notice] = 'FeatureLevel was successfully updated.'
        format.html { redirect_to(@feature_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature_level = FeatureLevel.find(params[:id])
    @feature_level.destroy

    respond_to do |format|
      format.html { redirect_to(spreedly_feature_levels_url) }
      format.xml  { head :ok }
    end
  end
  
  def gather
    @feature_levels = RSpreedly::SubscriptionPlan.all
    @feature_levels.collect!{|plan| plan.feature_level}.uniq!
    @feature_levels.each do |feature_level|
      local_plan = FeatureLevel.find_or_create_by_name(:name => feature_level)
    end
    redirect_to spreedly_feature_levels_url
  end
end
