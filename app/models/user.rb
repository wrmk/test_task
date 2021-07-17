class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_one :userinfo
  accepts_nested_attributes_for :userinfo, allow_destroy: true

  def self.sex(current_user)

    current_user.userinfo.update(:sex =>'male')

    # current_user.sex = "male"
  end       
end
