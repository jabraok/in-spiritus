module StringUtils
	def trim value
		Maybe(value).strip!.fetch(value) unless value.nil?
	end
end
