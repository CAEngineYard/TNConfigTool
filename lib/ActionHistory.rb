class ActionHistory
   attr_accessor :action, :userName, :date
   
   def initialize(action, userName, date)
      @action = action
      @userName = userName
      @date = date
   end
end