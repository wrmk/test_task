class HomeController < ApplicationController
  before_action :authenticate_user!

  require_relative "../models/dadata"


  def index
    if current_user
      @name = current_user.userinfo.name
      @email = current_user.email
      if current_user.userinfo.sex != nil
        @sex = current_user.userinfo.sex
        @confirmed = true
      else
        # @sex = Dadata.gender(current_user)
        @sex = 'test'
        @confirmed = false
      end 
    end
  end


  def update
    @sex= gender_params[:sex]
    current_user.userinfo.update gender_params
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
