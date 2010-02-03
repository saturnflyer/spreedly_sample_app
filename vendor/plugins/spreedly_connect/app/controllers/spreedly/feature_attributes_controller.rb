class Spreedly::FeatureAttributesController < ApplicationController
  def index
    @feature_attributes = FeatureAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feature_attributes }
    end
  end

  def show
    @feature_attribute = FeatureAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feature_attribute }
    end
  end

  def new
    @feature_attribute = FeatureAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feature_attribute }
    end
  end

  def edit
    @feature_attribute = FeatureAttribute.find(params[:id])
  end

  def create
    @feature_attribute = FeatureAttribute.new(params[:feature_attribute])

    respond_to do |format|
      if @feature_attribute.save
        flash[:notice] = 'FeatureAttribute was successfully created.'
        format.html { redirect_to(@feature_attribute) }
        format.xml  { render :xml => @feature_attribute, :status => :created, :location => @feature_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @feature_attribute = FeatureAttribute.find(params[:id])

    respond_to do |format|
      if @feature_attribute.update_attributes(params[:feature_attribute])
        flash[:notice] = 'FeatureAttribute was successfully updated.'
        format.html { redirect_to(@feature_attribute) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature_attribute = FeatureAttribute.find(params[:id])
    @feature_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(spreedly_feature_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
