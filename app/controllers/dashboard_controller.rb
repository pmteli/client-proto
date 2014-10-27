class DashboardController < ApplicationController
  layout 'splash'
  respond_to :html, :js, :json

  def index
    respond_with()
  end

  def coming_soon
    respond_with()
  end

end

