class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_one :userinfo
  accepts_nested_attributes_for :userinfo, allow_destroy: true

  require_relative "dadata_service"

  def self.gender(current_user)

    return gender = Dadata.gender(current_user)
    # current_user.userinfo.update(:sex =>'male')


  
  end       
end
