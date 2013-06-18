class Axiom::LoginController < ApplicationController
  def index
    #@settings = Account.get_saml_settings()
    #
    #if @settings.nil?
    #  return redirect_to '/saml'
    #end

    # If we're viewing this unauthenticated, set our goback URL for after logging in
    if session[:userid].nil?
      #session[:goback_to] = request.url
      session[:userid]=nil
      return redirect_to '/saml'

    end
    respond_to do |format|
      format.html # index.html.erb
    end

  end
end
