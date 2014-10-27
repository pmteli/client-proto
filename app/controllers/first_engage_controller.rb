class FirstEngageController < ApplicationController
  layout 'first_engage'
  respond_to :html, :js, :json

  def index
    session[:building_name] = "ponderosa_high_school"
    @building_name = session[:building_name]
    respond_with()
  end

  def your_cost
    @nav = params[:id]
    @chart = params['chart']
    @building_name = session[:building_name]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end

  def your_electric
    @building_name = session[:building_name]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end

  def your_gas
    @building_name = session[:building_name]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end

  def your_savings
    @building_name = session[:building_name]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end

end
