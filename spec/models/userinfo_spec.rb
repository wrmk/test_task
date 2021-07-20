require 'rails_helper'

RSpec.describe Userinfo, type: :model do

  before do
    @userinfo = Userinfo.new(name: "Петров Илья",gender: "Ж")
  end

  it "Save name only in 'а-Я' chars" do
    @userinfo.name = "9/* Виталий"
    @userinfo.validate
    expect(@userinfo.errors[:name]).to include("please input name as example")
  end

  it "Save correct genders" do
    @userinfo.gender = "9/* Виталий"
    @userinfo.validate
    expect(@userinfo.errors[:gender]).to include("please input correct gender 'М/Ж'")
  end  


end
