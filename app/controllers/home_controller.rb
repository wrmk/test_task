class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @name = current_user.userinfo.name
      @sex = User.gender(current_user)
    end
  end

  def create
    
  end
end
