module WeightRecordsHelper
  def dygraph_format(records)
    str = ""
    str << 'Date,Weight\\n'
    records.each do |record|
      str << record.time.to_s
      str << ','
      str << record.weight.to_s
      str << ',1'
      str << '\\n'
    end
    return str
  end

  def sum(num_array)
    sum = 0
    num_array.each do |num|
      sum += num
    end
    return sum
  end

  def avg(num_array)
    return sum(num_array) / num_array.length
  end

  def get_average(ordered_records, length)
    q = []
    average = {}
    ordered_records.each do |record|
      if q.length >= length
        q.delete_at(0)
      end
      q.push(record.weight)
      average[record.time.to_s] = "%.1f" % avg(q)
    end
    return average
  end

  def dygraph_format_avg(records, length)
    str = ""
    str << 'Date,Weight,Avg\\n'
    average = get_average(records, length)
    records.each do |record|
      str << record.time.to_s
      str << ','
      str << record.weight.to_s
      str << ',1'
      str << ','
      str << average[record.time.to_s]
      str << '\\n'
    end
    return str
  end

  def dygraph_format_ext(records, continued)
    str = ""
    str << 'Date, Daytime, Nighttime\\n'
    noon = 14
    night = 2
    date_set = Set.new
    daytime_records = {}
    nighttime_records = {}
    records.each do |record|
      date_set.add(record.time.to_date.to_s)
      if record.time.hour < noon and record.time.hour >= night then
      daytime_records[record.time.to_date.to_s] = record.weight.to_s
      else
      nighttime_records[record.time.to_date.to_s] = record.weight.to_s
      end
    end
    date_set.each do |date|
      str << date
      if (continued) then
        if daytime_records.has_key?(date) and nighttime_records.has_key?(date) then
          str << ',' + daytime_records[date]
          str << ',' + nighttime_records[date]
        end
        str << '\\n'
      else
        if daytime_records.has_key?(date)
          str << ',' + daytime_records[date]
        else
          str << ','
        end
        if nighttime_records.has_key?(date)
          str << ',' + nighttime_records[date]
        else
          str << ','
        end
        str << '\\n'
      end
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

  def dygraph_format_ext_avg(records)
    str = ""
    str << 'Date, Daytime, Nighttime\\n'
    noon = 14
    night = 2
    date_set = Set.new
    daytime_records = {}
    nighttime_records = {}
    records.each do |record|
      date_set.add(record.time.to_date.to_s)
      if record.time.hour < noon and record.time.hour >= night then
      daytime_records[record.time.to_date.to_s] = record.weight.to_s
      else
      nighttime_records[record.time.to_date.to_s] = record.weight.to_s
      end
    end
    date_set.each do |date|
      str << date
      if (continued) then
        if daytime_records.has_key?(date) and nighttime_records.has_key?(date) then
          str << ',' + daytime_records[date]
          str << ',' + nighttime_records[date]
        end
        str << '\\n'
      end
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
