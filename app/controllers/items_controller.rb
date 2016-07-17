class ItemsController < ApplicationJsonApiResourcesController
  def index
    authorize Item
    super
  end

  def show
    authorize Item
    super
  end

  def update
    authorize Item

    item = Item.find(params[:id])
    item.mark_pending!

    super
  end

  def create
    authorize Item
    super
  end

  def get_related_resource
    authorize Item
    super
  end

  def get_related_resources
    authorize Item
    super
  end

  def name_check
    authorize Item

    render json: {valid: false}
  end

end
