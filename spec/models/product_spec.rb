require 'rails_helper'

RSpec.describe Product, type: :model do
  let (:cat1) { Category.create(name: "Apparel") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(cat1.products.new(name: "Kendall",
      description: "hihi",
      price: 10,
      quantity: 3,
    )).to be_valid
    end

    it "is not valid without a name" do
      expect(cat1.products.create(name: nil,
        description: "hihi",
        price: 10,
        quantity: 3,
      ).errors.full_messages[0]).to eq "Name can't be blank"      
    end

    it "is not valid without a price" do
      expect(cat1.products.create(name: "Kendall",
        description: "hihi",
        price: nil,
        quantity: 3,
      ).errors.full_messages[0]).to eq "Price cents is not a number"      
    end

    it "is not valid without a quantity" do
      expect(cat1.products.create(name: "Kendall",
        description: "hihi",
        price: 10,
        quantity: nil,
      ).errors.full_messages[0]).to eq "Quantity can't be blank"      
    end

    it "is not valid without a category" do
      expect(Product.create(name: "Kendall",
        description: "hihi",
        price: 10,
        quantity: 3,
      ).errors.full_messages[0]).to eq "Category can't be blank"      
    end

  end
end
