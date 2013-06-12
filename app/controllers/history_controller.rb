require 'ActionHistory'

class HistoryController < ApplicationController

	def View
 
	 	@actionHistory = [ActionHistory.new("Initialize", "sclaus", DateTime.now) , ActionHistory.new("Activated", "ebunny", DateTime.now), ActionHistory.new("Exploded", "jfrost", DateTime.now)]
    
    render "View.html.erb", :layout => false
	end

end