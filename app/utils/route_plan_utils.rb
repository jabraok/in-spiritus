class RoutePlanUtils
  include PdfUtils

	def generate_packing_documents route_plans
		records = get_records route_plans
		generate_pdfs records
	end

  def generate_and_upload_packing_documents route_plans
		records = get_records route_plans
		generate_and_upload_pdfs records
	end

	private
  def get_records route_plans
    collection = (route_plans.respond_to? :each) ? route_plans : [route_plans]
    collection.flat_map(&method(:build_route_plan))
  end

	def build_route_plan route_plan
		[route_plan]
			.concat route_plan.route_visits
			.sort {|x,y| y.position <=> x.position}
			.flat_map(&:fulfillments)
			.flat_map(&:order)
			.select(&:has_quantity?)
	end
end
