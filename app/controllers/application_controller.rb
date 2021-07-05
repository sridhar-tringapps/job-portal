# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # current_user.locale
    # request.env["HTTP_ACCEPT_LANGUAGE"]
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || authenticated_root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end
end
