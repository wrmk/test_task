class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @name = current_user.userinfo.name
      User.sex(current_user)
      @sex = current_user.userinfo.sex
    end
  end

  def create
    
  end
end
