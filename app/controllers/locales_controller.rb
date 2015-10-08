class LocalesController < ApplicationController 
  skip_authorization_check

  def switch 
    case params[:locale]
      when 'en'
        session[:locale] = :en
      when 'fr'
        session[:locale] = :fr
    end

    redirect_to_back_or_default 
  end

  private
  
  def redirect_to_back_or_default(default = "/")
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to :root
    end
  end
end