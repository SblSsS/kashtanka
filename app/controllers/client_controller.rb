class ClientController < ApplicationController
	before_action :load_publics
	before_action :set_language

	private

	def load_publics
		@title = Settings.config[:title]
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
