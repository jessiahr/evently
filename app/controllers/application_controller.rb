class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  def set_organization
    return if params[:organization_id].nil?
    @organization = Organization.find_by_name(params[:organization_id])
    if (@organization == nil)
      @organization = Organization.find(params[:organization_id])
    end
  end
end
