class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_request_variant

  private

  def set_request_variant
    request.variant = :mobile if browser.device.mobile?
    request.variant = :tablet if browser.device.tablet?
  end
end
