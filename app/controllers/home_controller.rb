class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @name = current_user.userinfo.name
      @email = current_user.email
      @sex = User.get_gender(current_user)
       
    end
  end

  def update
    @sex= gender_params[:sex]
    respond_to do |format|
      # format.html {render "index"}
      format.js
    end
  end


  private

  def gender_params
      params.permit(:sex)
  end 
end
