class HomeController < ApplicationController
  layout :resolve_layout
  respond_to :html, :js, :json

  def index
    @building_id = params[:building_id]
    @building = Building.find_by_building_id(@building_id)
    @building_name = @building.building_name.parameterize.underscore
    session[:building_id] = @building_id
    session[:building_name] = @building_name
    @fuel_type = "electric"
    session[:fuel_type] = @fuel_type
    respond_with()
  end

  def eon_index
    @building_id = params[:building_id]
    @building = Building.find_by_building_id(@building_id)
    @building_name = @building.building_name.parameterize.underscore
    puts "-----------------"
    puts "buiilding name = #{@building_name}"
    puts "-----------------"
    session[:building_id] = @building_id
    session[:building_name] = @building_name
    @fuel_type = "electric"
    session[:fuel_type] = @fuel_type
    respond_with()
  end

  def your_cost
    @nav = params[:id]
    @fuel_type = "electric"
    @chart = params['chart']
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()
  end

  def your_electric
    @building_name = session[:building_name]
    @building_id = session[:building_id]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    @fuel_type = "electric"
    respond_with()

  end

  def your_gas
    @building_name = session[:building_name]
    @fuel_type = "gas"
    @building_id = session[:building_id]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    @fuel_type = "non_eon"
    respond_with()

  end


  def your_usage
    @building_name = session[:building_name]
    @fuel_type="electric"
    puts "------------------------"
    puts "fuel type = #{@fuel_type}"
    puts "------------------------"
    @building_id = session[:building_id]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end

  def your_savings
    @building_name = session[:building_name]
    @fuel_type = "gas"
    puts "------------------------"
    puts "fuel type = #{@fuel_type}"
    puts "------------------------"
    @building_id = session[:building_id]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end


  def energy_analysis
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    puts "------------------------"
    puts "fuel type = #{@fuel_type}"
    puts "------------------------"
    @building_id = session[:building_id]
    @content_id = params[:id]
    @tab_id = params['tab_id']
    respond_with()

  end

  def energy_performance
    @building_name = session[:building_name]
    @fuel_type = session[:fuel_type]
    @building_id = session[:building_id]
    @content_id = params[:content_id]
    @tab_id = params[:tab_id]

    respond_with()
  end

  def portfolio

    @content_id = params[:id]
    @lat ="42.471911".to_f
    @lng = "-71.248612".to_f
    @buildings = Building.where(:portfolio_name => "Utility Company")
    #@buildings = Building.find(:all, :order => 'building_name', :limit => 12)
    respond_with()

  end

  def list_view
    User.where("name like ?", "%#{params[:query]}%")
    @buildings = Building.where("building_id like ?", :"fe_demo_building_%")
    #@buildings = Building.find(:all, :order => 'building_name', :limit => 12)
    @content_id = params[:content_id]
    @tab_id = params['tab_id']
    respond_with()
  end

  def map_view
    #@buildings = Building.find(:all, :order => 'building_name', :limit => 12)
    @buildings = Building.where("building_id like ?", :"fe_demo_building_%")
    @building_name = session[:building_name]
    @content_id = params[:content_id]
    @tab_id = params['tab_id']
    respond_with()
  end

  def load_building
    @building_id  = params[:param_2]
    @building = Building.find_by_building_id(@building_id)
    @building_name = @building.building_name.parameterize.underscore
    puts "-----------------"
    puts "buiilding name = #{@building_name}"
    puts "-----------------"
    session[:building_id] = @building_id
    session[:building_name] = @building_name

    respond_with()

  end

  private

  def resolve_layout
    case action_name
      when "portfolio"
        "portfolio"
      when "eon_index"
        "eon_tabs"
      else
        "first_engage"
    end
  end

end
