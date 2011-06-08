class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def current_mod
      Mod.find(session[:mod_id])
      
      rescue ActiveRecord::RecordNotFound
        mod = Mod.create
        session[:mod_id] = mod.id
        mod
    end

end
