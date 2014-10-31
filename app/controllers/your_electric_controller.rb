class YourElectricController < ApplicationController
  layout 'first_engage'
  respond_to :html, :js, :json

  def index
    session[:building_name] = "ponderosa_high_school"
    @building_name = session[:building_name]
    respond_with()
  end

  def usage
    @building_name = session[:building_name]
    #@content_id = params[:id]
    @chart_id = "usage_chart"
    @recomm_id = "usage_recomm"
    @chart = params[:chart]
    @chart_url = "/your_electric/usage/#{@chart}_chart"
    @recomm_url = "/your_electric/usage/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()

  end

  def cost
    @building_name = session[:building_name]
    #@content_id = params[:id]
    @chart_id = "cost_chart"
    @recomm_id = "cost_recomm"
    @chart = params[:chart]
    @chart_url = "/your_electric/cost/#{@chart}_chart"
    @recomm_url = "/your_electric/cost/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()

  end

  def weather
    @building_name = session[:building_name]
    #@content_id = params[:id]
    @chart_id = "weather_chart"
    @recomm_id = "weather_recomm"
    @chart = params[:chart]
    @chart_url = "/your_electric/weather/#{@chart}_chart"
    @recomm_url = "/your_electric/weather/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()
  end
  def schedule
    @building_name = session[:building_name]
    #@content_id = params[:id]
    @chart_id = "schedule_chart"
    @recomm_id = "schedule_recomm"
    @chart = params[:chart]
    @chart_url = "/your_electric/schedule/#{@chart}_chart"
    @recomm_url = "/your_electric/schedule/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()

  end


  def peak_demand_days
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @chart_id = "peak_demand_days_chart"
    @recomm_id = "peak_demand_days_recomm"
    @chart_url = "/your_electric/peak_demand_days/#{@chart_id}"
    @recomm_url = "/your_electric/peak_demand_days/#{@recomm_id}"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@recomm_id}"
    puts "----------------------"

    respond_with()

  end

  def daily_load_profile
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @chart_id = "daily_load_profile_chart"
    @recomm_id = "daily_load_profile_recomm"
    @chart_url = "/your_electric/daily_load_profile/#{@chart_id}"
    @recomm_url = "/your_electric/daily_load_profile/#{@recomm_id}"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@recomm_id}"
    puts "----------------------"

    respond_with()

  end

  def operating_schedule
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @chart_id = "operating_schedule_chart"
    @recomm_id = "operating_schedule_recomm"
    @chart_url = "/your_electric/operating_schedule/#{@chart_id}"
    @recomm_url = "/your_electric/operating_schedule/#{@recomm_id}"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@recomm_id}"
    puts "chart_url = #{@tab_id}"
    puts "----------------------"

    respond_with()

  end

  def meter_data
    #id = session[:building_id]
    #building_id = "peco_demo_1"
    building_id = session[:building_id]
    @building = Building.find_by_building_id(building_id)
    @building_name = @building.building_name.parameterize.underscore
    @fuel_type = session[:fuel_type]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    puts "-------------------"
    puts "buildings name  = #{@building_name}"
    puts "-------------------"
    @meters = Meter.where(:building_id => building_id)

    respond_with()

  end

  def download_csv
    id = session[:building_id]
    puts "-------------------"
    puts "buildings id = #{id}"
    puts "-------------------"
    @building = Building.find_by_building_id(id)
    #@building_name = @buildings.building_name.parameterize.underscore
    @building_name = "ponderosa_high_school"
    meter_id = params['meter_id']
    send_file "public/data/buildings/#{@building_name}/electric/meter_data/#{meter_id}.csv", :type=>"application/csv"
  end

  def aggregated_meter_chart
    #id = session[:building_id]
    id = "peco_demo_1"
    puts "-------------------"
    puts "buildings id = #{id}"
    puts "-------------------"
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @building = Building.find_by_building_id(id)
    @meters = Meter.where(:building_id => id).all
    #@building_name = @buildings.building_name.parameterize.underscore
    @building_name = "ponderosa_high_school"

    respond_with()
  end

  def end_use_distribution
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @chart_id = "end_use_distribution_chart"
    @recomm_id = "end_use_distribution_recomm"
    @chart_url = "/your_electric/end_use_distribution/#{@chart_id}"
    @recomm_url = "/your_electric/end_use_distribution/#{@recomm_id}"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@recomm_id}"
    puts "----------------------"

    respond_with()

  end

  def occupancy_ratio
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @chart_id = "occupancy_ratio_chart"
    @recomm_id = "occupancy_ratio_recomm"
    @chart_url = "/your_electric/occupancy_ratio/#{@chart_id}"
    @recomm_url = "/your_electric/occupancy_ratio/#{@recomm_id}"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@recomm_id}"
    puts "----------------------"

    respond_with()

  end


  def recommendations
    @building_name = session[:building_name]
    @content_id = params[:id]
    @category = params[:category]
    @recomm_url = "/your_electric/#{@category}/recommendations"
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "recomm_url = #{@recomm_url}"
    puts "----------------------"

    respond_with()

  end

end
