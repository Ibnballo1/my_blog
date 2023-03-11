class ApplicationController < ActionController::Base
  def current_user
    @users = User.first
  end
end
