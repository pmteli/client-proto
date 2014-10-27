class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#  before_filter :configure_app
  before_filter :authenticate_user!
  #before_filter :check_for_mobile
  before_filter :update_sanitized_params, if: :devise_controller?

  #before_filter :skip_or_force_mobile

  #include Mobylette::RespondToMobileRequests

  #mobylette_config do |config|
  #  config[:mobile_user_agents] = proc { %r{iphone|android}i }
  #  config[:skip_user_agents]   = []
  #end



  def configure_app
    if user_signed_in?
      @user_role = current_user.role
      puts "-------------------"
      puts "current user = #{current_user.role}"
      puts "-------------------"
      @admin_config = YAML::load(File.open("#{Rails.root}/config/admin_config.yml"))
      @top_menu = @admin_config[@user_role]['top_menu']
      @left_menu = @admin_config[@user_role]['left_menu']
    end
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :role, :last_name, :email_confirmation,  :email, :password, :password_confirmation, :username)}
  end


  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    session[:tablet_override] = params[:tablet] if params[:tablet]

    puts "-----------------------"
    puts "Checking for mobile device"
    puts "#{request.user_agent}"
    puts "-----------------------"

    if tablet_device?
      prepare_for_tablet
    elsif mobile_device?
      prepare_for_mobile
    end

  prepare_for_mobile if mobile_device?

  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views/mobile'
  end

  def prepare_for_tablet
    prepend_view_path Rails.root + 'app' + 'views/tablet'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/)
    end
  end

  def tablet_device?
    if session[:tablet_override]
      session[:tablet_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /iPad/)
    end
  end

  helper_method :mobile_device?
  helper_method :tablet_device?

  #private

  #def skip_or_force_mobile
  #  session[:mobylette_override] = :ignore_mobile if params[:skip_mobile]
  #  session[:mobylette_override] = :force_mobile if params[:force_mobile]
  # end


 end
