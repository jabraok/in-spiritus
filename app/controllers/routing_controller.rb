class RoutingController < ApplicationJsonApiResourcesController
  def optimize_route
    authorize :routing

    # The magik should happen with routific
    render json: {response: 'Yes!'}
  end
end
