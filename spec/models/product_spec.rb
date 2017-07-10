require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
     before(:each) do
      @category = Category.new
      @category.name = 'Apparel'
      @category.save
     end

    it "Everything adds" do
      @product = Product.new
      @product.name = "TEST"
      @product.price = 29.99
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save
      expect(@product.valid?).to be true
    end

    it "Name is nil" do
      @product = Product.new
      @product.price = 29.99
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save
      expect(@product.valid?).to be false
    end

    it "Price is nil" do
      @product = Product.new
      @product.name = "TEST"
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save
      expect(@product.valid?).to be false
    end

    it "Quantity is nil" do
      @product = Product.new
      @product.name = "TEST"
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save
      expect(@product.valid?).to be false
    end

    it "Category is nil" do
      @product = Product.new
      @product.name = "TEST"
      @product.quantity = 10
      @product.save
      expect(@product.valid?).to be false
    end
  end


end