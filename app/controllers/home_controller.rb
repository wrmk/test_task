class HomeController < ApplicationController
  before_action :authenticate_user!

  require_relative "../models/dadata"

  def index
    userinfo
    @name = current_user.userinfo.name
    @email = current_user.email
    
    if current_user.userinfo.sex != nil
      @sex = current_user.userinfo.sex
      @confirmed = true
    else
      # @sex = Dadata.gender(current_user.userinfo.name)
      @sex = "Ж"
      current_user.userinfo.update(:sex_updated => DateTime.now)
      @confirmed = false
    end 
  end

  def update
    userinfo
    current_user.userinfo.update gender_params
    @sex = current_user.userinfo.sex
    respond_to do |format|
      format.html {render "index"}
      format.js
    end
  end


  private

  def userinfo
    @gender_hash = {"М" => "Мужской", "Ж" => "Женский"}
    @update_date = current_user.userinfo.sex_updated
  end
  def gender_params
    params.permit(:sex)
  end 
  
end
