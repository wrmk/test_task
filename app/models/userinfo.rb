class Userinfo < ApplicationRecord
  validates :name,  presence: true,format: { with: /\A[а-яА-Я, ]+\z/, message: "please input name as example"}
  validates :sex, inclusion: { :in => ["М","Ж",nil], message: "please input correct gender 'М/Ж'"}

  belongs_to :user
end
