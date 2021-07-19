class HomeController < ApplicationController
  before_action :authenticate_user!

  require_relative "../models/dadata"


  def index
    @gender_hash = {"М" => "Мужской", "Ж" => "Женский"}
    if current_user
      @name = current_user.userinfo.name
      @email = current_user.email
      if current_user.userinfo.sex != nil
        @sex = current_user.userinfo.sex
        @confirmed = true
      else
        # @sex = Dadata.gender(current_user)
        @sex = @gender_hash["М"]
        @confirmed = false
      end 
    end
  end


  def update
    current_user.userinfo.update gender_params
    @sex = current_user.userinfo.sex
    respond_to do |format|
      format.html {render "index"}
      format.js
    end
  end


  private

  def gender_params
      params.permit(:sex)
  end 
end
