class DashboardController < ApplicationController
  load_and_authorize_resource class: "User"

  def index
    Rails.logger.debug @dashboards.to_sql
  end

  def current_user
    User.new(id: 1, admin: false)
  end
end
