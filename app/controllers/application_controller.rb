class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  layout 'application'

  private

#    def default_url_options(options={})
#      { :language => I18n.locale }
#    end

    def set_locale
      logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
      I18n.locale = extract_locale_from_accept_language_header
      logger.debug "* Locale set to '#{I18n.locale}'"
    end

    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

end
