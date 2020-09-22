require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it "a new user is created with a first name, last name and matchiing password and passwoprd confirmation" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", email: "madeup@gmail.com", password: "123", password_confirmation: "123")
      expect(@user.save).to be(true) 
    end

    it "is not valid if password and password confirmation do not match" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", password: "123", password_confirmation: "BOB")
      expect(@user.save).to be(false)
    end

    it "a new user instance requires password and confirmation field" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", password: "123")
      expect(@user.save).to be(false)
    end

    # it "is not valid if password or password confirmation are nil" do
    #   @user = User.new(first_name: "Bert", last_name: "Reynolds", password: "123", password_confirmation: nil)
    #   expect(@user.save).to be(false)
    # end
    
  
  end

end
