class SettingsController < ApplicationJsonApiResourcesController
  def index
    authorize Setting
    super
  end

  def show
    authorize Setting
    super
  end

  def create
    authorize Setting
    super
  end

  def update
    authorize Setting
    super
  end

   def destroy
    authorize Setting
    super
  end

  def get_related_resource
    authorize Setting
    super
  end

  def get_related_resources
    authorize Setting
    super
  end
end
