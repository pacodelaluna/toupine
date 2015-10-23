class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_blog_entries, :set_locale


  def get_blog_entries
  	@blog_entries = Spree::BlogEntry.visible.page(@pagination_page).first(4)
  end 
 
	def set_locale
    if !session[:locale]
      session[:locale] = I18n.default_locale
    end

  	I18n.locale = session[:locale] || I18n.default_locale
	end
end
