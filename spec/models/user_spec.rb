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

    it "a new user instance requires password field" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", email: "madeup@gmail.com", password: "123")
      expect(@user.save).to be(false)
    end

    it "a new user instance requires confirmation field" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", email: "madeup@gmail.com", password: "123")
      expect(@user.save).to be(false)
    end

    it "is not valid if password or password confirmation are nil" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", email: "madeup@gmail.com", password: nil, password_confirmation: nil)
      expect(@user.save).to be(false)
    end
    
    it "is not valid if multiple users have the same email regardless of case" do
      @user1 = User.new(first_name: "Bert", last_name: "Reynolds", email: "madeup@gmail.com", password: "123", password_confirmation: "123")
      expect(@user1.save).to be true
      @user2 = User.new(first_name: "Bert", last_name: "Reynolds", email: "MADEUP@gmail.com", password: "123", password_confirmation: "123")
      expect(@user2.save).to be false
    end
    
    it "is not valid if password is shorter than 3 characters" do
      @user = User.new(first_name: "Bert", last_name: "Reynolds", email: "madeup@gmail.com", password: "123", password_confirmation: "123")
      expect(@user.password.length).to be_between(3,20).inclusive
    end

  end

end
