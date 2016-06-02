class DashboardController < ApplicationController
  load_and_authorize_resource class: "User"

  def index
    Rails.logger.debug @users
  end

  def current_user
    User.new
  end
end
