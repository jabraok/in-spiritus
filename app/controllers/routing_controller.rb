class RoutingController < ApplicationJsonApiResourcesController
  def optimize_route
    authorize :routing

    # 1. Prepare the request data
    # 2. POST to routific to the min-idle endpoint: https://api.routific.com/min-idle
    # 3. Send response to the client
    # 4. render json: routific_response

    render json: {response: 'Yes!'}
  end
end
