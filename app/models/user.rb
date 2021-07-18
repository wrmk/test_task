class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_one :userinfo
  accepts_nested_attributes_for :userinfo, allow_destroy: true

  require_relative "dadata"

  def self.get_gender(current_user)
    if current_user.userinfo.sex != nil
      return gender = current_user.userinfo.sex
    else
      # return gender = Dadata.gender(current_user)
      return gender = 'test'
    end
  end       

  
end
