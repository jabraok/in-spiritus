module FirebaseUtils
	def fb(uri = ENV['FIREBASE_URL'])
		@fb_client ||= Firebase::Client.new(uri)
  end

	def build_stock_level_data_point(stock_level)
		stock = stock_level.stock
		fulfillment = stock.fulfillment
		order = fulfillment.order
		location = stock.location
		item = stock_level.item
		ending_level = stock_level.ending_level

		previous_stock_level = location.previous_stock_level(stock_level)
		previous_ending_level = Maybe(previous_stock_level).ending_level.fetch(0)

		sold = previous_ending_level - (stock_level.starting + stock_level.returns)

		timestamp = stock.taken_at.to_i
		uuid = SecureRandom.uuid

		data_key = "locations/#{location.code}/#{item.code}/#{uuid}"
		data_payload = {
			starting: stock_level.starting,
			returns: stock_level.returns,
			ending: ending_level.to_i,
			previous_ending: previous_ending_level.to_i,
			sold: [sold.to_i, 0].max,
			ts: timestamp
		}

		fb.update("", {
			data_key => data_payload
		})
	end
end
