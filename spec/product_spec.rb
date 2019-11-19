require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # create one new product will all fields
    it "is valid with valid attributes" do
      category = Category.find_or_create_by! name: 'Apparel'
      product = category.products.create(name:  'Men\'s Classy shirt',
        description: "test",
        quantity: 10,
        price: 64.99)
      expect(product).to be_valid
    end

    it "is not valid with without a name" do
      category = Category.find_or_create_by! name: 'Apparel'
      product = Product.new(name: nil)
      expect(product).to_not be_valid
      puts product.errors.full_messages
    end
    
    it "is not valid with without a price" do
      category = Category.find_or_create_by! name: 'Apparel'
      product = Product.new(price: nil)
      expect(product).to_not be_valid
    end

    it "is not valid with without a quantity" do
      category = Category.find_or_create_by! name: 'Apparel'
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
    end

    it "is not valid with without a category" do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
    end
  end
  
end