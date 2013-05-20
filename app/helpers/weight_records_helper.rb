module WeightRecordsHelper
	def dygraph_format(records)
		str = ""
		str << 'Date,Weight\\n'
		records.each do |record|
			str << record.time.to_s
			str << ','
			str << record.weight.to_s
			str << '\\n'
		end
		return str
	end

	def dygraph_range(records)
		max = 0
		min = 99999
		records.each do |record|
			weight = record.weight
			if weight < min
				min = weight
			end
			if weight > max
				max = weight
			end
			max = max.to_i
			min = min.to_i
			high = max + 10.to_i
			low = min - 10.to_i
			if low < 0
				low = 0
			end
		end
		range = [low, high]
		return range
	end
end
