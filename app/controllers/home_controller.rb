class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
    @email = current_user.email
    end
  end
end
