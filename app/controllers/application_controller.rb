class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_character
    Character.find(session[:character_id])
    rescue ActiveRecord::RecordNotFound
    character = Character.first
    session[:character_id] = character.id
    character
  end



end
