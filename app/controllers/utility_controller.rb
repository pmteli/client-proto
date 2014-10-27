class UtilityController < ApplicationController
  layout 'utility'
  respond_to :html, :js, :json

  def index
    @building_id = "fe_demo_building_1"
    session[:building_id] = @building_id
    session[:building_name] = "ponderosa_high_school"
    @building_name = session[:building_name]
    @series_1 = "All Visitors"
    session[:chart_view] = "ecm_chart"
    session[:table_view] = "ecm_table"
    @fuel_type = "electric"
    @buildings = Building.where("building_id like ?", :"fe_demo_building_%")
    respond_with()

  end

  def filter_users
    session[:building_id] = @building_id
    session[:building_name] = "ponderosa_high_school"
    @building_name = session[:building_name]
    @chart_id = "chart-view"
    @chart_url = "/utility/ecm_chart"
    @kpi_id = "kpi-bar"
    @kpi_url = "/utility/kpi_bar"
    @table_id = "table-view"
    @table_url = "/utility/tabl_view"
    respond_with()

  end

  def save_filter
    @building_id = "fe_demo_building_1"
    session[:building_id] = @building_id
    session[:building_name] = "ponderosa_high_school"
    @building_name = session[:building_name]
    @fuel_type = "electric"
    @buildings = Building.where("building_id like ?", :"fe_demo_building_%")
    respond_with()

  end

  def view_chart
    @view = params[:param_2]
    @chart = params[:param_1]
    puts "---------------"
    puts "chart = #{@chart}"
    puts "---------------"
    session[:chart_view] = @chart
    @chart_id = "chart-view"
    @chart_url = "/utility/#{@chart}"
    respond_with()

  end

  def view_report
    @report_id = params[:param_1]
    @report_title = @report_id.humanize();
    @report_url = "/utility/reports/#{@report_id}"
    @view = params[:param_2]
    @chart = params[:param_1]
    session[:chart_view] = @chart
    @chart_id = "chart-view"
    @chart_url = "/utility/#{@chart}"
    respond_with()

  end

  def chart_view
    @content_id = params[:content_id]
    #@view = params[:param_2]
    #session[:chart_view] = @view
    @chart_view = session[:chart_view]
    @series_1 = "All Visitors"
    @chart_url = "/utility/#{@chart_view}"
    #$@chart_url = "/utility/chart"
    @tab_id = params[:tab_id]
    session[:building_id] = @building_id
    @building_name = session[:building_name]
    @buildings = Building.where("building_id like ?", :"fe_demo_building_%")
    respond_with()

  end

  def list_view
    @content_id = params[:content_id]
    @table_view = session[:table_view]
    @list_url = "/utility/#{@table_view}"
    @tab_id = params[:tab_id]
    session[:building_id] = @building_id
    @building_name = session[:building_name]
    @buildings = Building.where("building_id like ?", :"fe_demo_building_%")
    respond_with()
  end

  def download_report
    if  session[:chart_view] == "ecm_chart"
      filename  = "users_ecm_report.pdf"
    else
      filename = "users_actions_report.pdf"
    end
    send_file "public/downloads/" + filename, :type=>"application/pdf"
  end


  def view_metric
    @view = params[:param_2]
    @table_view = params[:param_1]
    if @view  != nil
      session[:chart_view] = @view
    else
      session[:chart_view] = "all_visits_chart"
    end
    #session[:chart_view] = "all_visits_chart"
    @chart_view = session[:chart_view]
    #@series_1 = @chart_view.classify.gsub(/[A-Z]/, ' \0').sub! 'Chart', ''
    @series_1 = "All Visits"
    session[:table_view] = @table_view
    @chart_id = "chart-view"
    @chart_url = "/utility/#{@view}"
    respond_with()

  end


  def reports
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]
    @view = params[:param_2]
    @table_view = params[:param_1]
    @chart_view = session[:chart_view]

    respond_with()

  end

end
