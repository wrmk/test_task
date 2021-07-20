class HomeController < ApplicationController
  before_action :authenticate_user!

  require_relative "../models/dadata"

  def index
    userinfo
    @name = current_user.userinfo.name
    @email = current_user.email
    
    if current_user.userinfo.gender != nil
      @gender = current_user.userinfo.gender
      @confirmed = true
    else
      # @gender = Dadata.gender(current_user.userinfo.name)
      @gender = "Ж"
      current_user.userinfo.update(:gender_updated => DateTime.now)
      @confirmed = false
    end 
  end

  def update
    userinfo
    current_user.userinfo.update gender_params
    @gender = current_user.userinfo.gender
    respond_to do |format|
      format.html {render "index"}
      format.js
    end
  end


  private

  def userinfo
    @gender_hash = {"М" => "Мужской", "Ж" => "Женский"}
    @update_date = current_user.userinfo.gender_updated
  end
  def gender_params
    params.permit(:gender)
  end 
  
end
