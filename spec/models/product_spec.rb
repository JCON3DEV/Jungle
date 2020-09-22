require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid only with a name, price, quantity, and category" do
      @category = Category.new(name: "Cat1")
      @product = Product.new(name: "electric toenail clipper", price: 25, quantity: 1, category: @category)
      
      expect(@product.save).to be(true)
    end

    it "is not valid without a name" do
      @category = Category.new(name: "electronics")
      @product = Product.new(price: 25, quantity: 1, category: @category)  
      # byebug
      expect(@product.save).to be(false)
    end

    it "is not valid without a price" do
      @category = Category.new(name: "electronics")
      @product = Product.new(name: "electric toenail clipper", quantity: 1, category: @category)  
      expect(@product.save).to be(false)
    end

    it "is not valid without a quantity" do
      @category = Category.new(name: "electronics")
      @product = Product.new(name: "electric toenail clipper", price: 500, category: @category)  
      expect(@product.save).to be(false)
    end

    it "is not valid without a category" do
      @product = Product.new(name: "electric toenail clipper", price: 500, quantity: 4)  
      expect(@product.save).to be(false)
    end

  end

  
end
