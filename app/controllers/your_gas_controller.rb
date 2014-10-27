class YourGasController < ApplicationController
  layout 'first_engage'
  respond_to :html, :js, :json

  def index
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @tab_id = params['tab_id']
    @type = params[:type]
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
    #@content_id = params[:id]
    @chart_id = "weather_chart"
    @recomm_id = "weather_recomm"
    @chart = params[:chart]
    @chart_url = "/your_gas/weather/#{@chart}_chart"
    @recomm_url = "/your_gas/weather/#{@chart}_recomm"
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

end
