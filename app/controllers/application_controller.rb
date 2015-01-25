class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_language

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:signin)}
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation)}
  end

  def set_language
    if !cookies[:locale]
      loc          = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first if (request.env['HTTP_ACCEPT_LANGUAGE'])
      I18n.locale  = loc
      I18n.locale  = I18n.t(:exist) == "ok" && Language.published.exists?( iso: I18n.locale.to_s ) ? loc : I18n.default_locale
      cookies[:locale] = {:value => loc, :expires => 2.weeks.from_now.utc}
    else
      I18n.locale = Language.published.exists?(iso: cookies[:locale]) ? cookies[:locale] : I18n.default_locale
    end

    @locale = Language.find_by_iso(I18n.locale)
  end
end
