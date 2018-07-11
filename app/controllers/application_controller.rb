class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery
  before_action :authenticate_user!, except: [:root_path, :index, :about]

  def user_not_authorized
    flash[:alert] = "You do not have permissions to perform this action."
    redirect_to(request.referrer || root_path)
  end

end