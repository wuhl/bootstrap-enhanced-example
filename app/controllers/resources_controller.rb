class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: t('flash.actions.create.notice', model: Resource.model_name.human( :count=>1 ) )
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: t('flash.actions.update.notice', model: Resource.model_name.human( :count=>1 ) )
    else
      render action: 'edit'
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: t('flash.actions.delete.notice', model: Resource.model_name.human( :count=>1 ) )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:first_name, :last_name, :start)
    end
end
