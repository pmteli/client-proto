class Building < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode


  def full_address
    "#{address_1}, #{city}, #{state}, #{zipcode}, #{country}"
  end

  def short_address
    "#{address_1}, #{city}, #{state}"
  end

  def self.sample_data
    arr = Array.new
    Building.find(:all).each do |b|
      h = {"Consumption(kwh)" => b.total_consumption, "name" => "#{b.building_name}", "Cost($)" => b.total_cost}
      arr << h
    end

   return arr.to_json.html_safe

  end

  def assessment_start_date
    return self.assessment_start.strftime("%Y,%m-1,%d").html_safe
  end

  def interval_data(meter_id)
    #idata = IntervalData.where('processed_raw_data_id =?', '220cd6dd-f092-41ba-883f-b861e36a303c').first
    arr = Array.new
    idata  = IntervalData.where(:analysis_id => meter_id).order('usage_date ASC').limit(365)

    idata.each do |d|
      (1..96).each do |i|
        arr << d.send("interval_#{i.to_s}")
      end
    end

    return arr.to_json.html_safe

  end

end
