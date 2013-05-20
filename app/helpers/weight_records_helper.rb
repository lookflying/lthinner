module WeightRecordsHelper
	def dygraph_format(records)
		str = ""
		str << '"Date,Weight\\n'
		records.each do |record|
			str << record.time.to_s
			str << ','
			str << record.weight.to_s
			str << '\\n'
		end
			str << '"'
		return str
	end
end
