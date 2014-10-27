class YourUsageController < ApplicationController
  layout 'first_engage'
  respond_to :html, :js, :json

  def index
    session[:building_name] = "ponderosa_high_school"
    @fuel_type = "electric"
    session[:fuel_type] = @fuel_type
    @building_name = session[:building_name]
    respond_with()
  end

  def usage
    @building_name = session[:building_name]
    #@content_id = params[:id]
    @chart_id = "usage_chart"
    @recomm_id = "usage_recomm"
    @chart = params[:chart]
    @chart_url = "/your_gas/usage/#{@chart}_chart"
    @recomm_url = "/your_gas/usage/#{@chart}_recomm"
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
    @chart_url = "/your_gas/cost/#{@chart}_chart"
    @recomm_url = "/your_gas/cost/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()

  end

  def weather
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    #@content_id = params[:id]
    @chart_id = "weather_chart"
    @recomm_id = "weather_recomm"
    @chart = params[:chart]
    @chart_url = "/your_usage/weather/#{@chart}_chart"
    @recomm_url = "/your_usage/weather/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()
  end
  def schedule
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    #@content_id = params[:id]
    @chart_id = "schedule_chart"
    @recomm_id = "schedule_recomm"
    @chart = params[:chart]
    @chart_url = "/your_gas/schedule/#{@chart}_chart"
    @recomm_url = "/your_gas/schedule/#{@chart}_recomm"
    puts "----------------------"
    puts "chart ID = #{@chart_id}"
    puts "chart_url = #{@chart_url}"
    puts "----------------------"

    respond_with()

  end


  def recommendations
    @building_name = session[:building_name]
    @content_id = params[:id]
    @category = params[:category]
    @recomm_url = "/your_gas/#{@category}/recommendations"
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "recomm_url = #{@recomm_url}"
    puts "----------------------"

    respond_with()

  end

  def gas
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @fuel_type = 'gas'
    session[:fuel_type] = @fuel_type
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "----------------------"

    respond_with()

  end

  def electric
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @fuel_type = 'electric'
    session[:fuel_type] = @fuel_type
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "----------------------"

    respond_with()

  end

  def monthly_chart
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @fuel_type = session[:fuel_type]
    @chart_url = "/your_#{@fuel_type}/usage_slider"
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "----------------------"

    respond_with()

  end

  def daily_chart
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @fuel_type = session[:fuel_type]
    puts "----------------------"
    puts "fuel_type  = #{@fuel_type}"
    puts "----------------------"
    @chart_url = "/your_#{@fuel_type}/usage/daily_chart"

    respond_with()

  end

  def weather_analytics
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @fuel_type = session[:fuel_type]
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "----------------------"

    @chart_url = "/your_#{@fuel_type}/usage/weather_analytics"

    respond_with()

  end

  def energy_analytics
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @fuel_type = session[:fuel_type]
    puts "----------------------"
    puts "content ID = #{@content_id}"
    puts "----------------------"
    @chart_url = "/your_#{@fuel_type}/usage/energy_analytics"

    respond_with()

  end

end
