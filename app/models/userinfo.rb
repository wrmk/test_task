class Userinfo < ApplicationRecord
  validates :name,  presence: true,format: { with: /\A[а-яА-Я, ]+\z/, message: "please input name as example"}
  validates :sex, inclusion: ["М","Ж",nil] 

  belongs_to :user
end
