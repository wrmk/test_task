class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
    @name = current_user.name
    end
  end
end
