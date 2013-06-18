require 'ActionHistory'

class HistoryController < ApplicationController

	def show
    if session[:userid].nil?
      #session[:goback_to] = request.url
      session[:userid]=nil
     return redirect_to '/saml'

    end
	 	@actionHistory = [ActionHistory.new("Initialize", "sclaus", DateTime.now) , ActionHistory.new("Activated", "ebunny", DateTime.now), ActionHistory.new("Exploded", "jfrost", DateTime.now)]
    
    #render "View.html.erb", :layout => true
    respond_to do |format|
      format.html # index.html.erb
    end
  end


end