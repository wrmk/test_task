class HomeController < ApplicationController
  before_action :authenticate_user!

  require_relative "../models/dadata"

  def index
    gender_hash
    @name = current_user.userinfo.name
    @email = current_user.email
    if current_user.userinfo.sex != nil
      @sex = current_user.userinfo.sex
      @confirmed = true
    else
      # @sex = Dadata.gender(current_user)
      @sex = "Ж"
      @confirmed = false
    end 
  end

  def update
    gender_hash
    current_user.userinfo.update gender_params
    @sex = gender_params[:sex]
    respond_to do |format|
      format.html {render "index"}
      format.js
    end
  end


  private

  def gender_hash
    @gender_hash = {"М" => "Мужской", "Ж" => "Женский"}
  end
  def gender_params
    params.permit(:sex)
  end 
  
end
