require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(first_name: "Kendall",
    last_name: "Rowe",
    email: "kendall.rowe312@gmail.com",
    password: "1234",
    password_confirmation: "1234"
  )}
    
  describe "Validations" do
    it "is valid with valid attributes" do
      subject.save
      expect(subject).to be_valid
    end
    
    context "passwords" do
      it "is not valid with not matching password_confirmation" do
        subject.password_confirmation = "4321"
        subject.save
        expect(subject).to_not be_valid
      end

      it "is not valid with nil password_confirmation" do
        subject.password = "Hi"
        subject.password_confirmation = nil
        subject.save
        expect(subject).to_not be_valid
      end
    end

    # it "is not valid without a name" do
    #   expect(cat1.products.create(name: nil,
    #     description: "hihi",
    #     price: 10,
    #     quantity: 3,
    #   ).errors.full_messages[0]).to eq "Name can't be blank"      
    # end

    # it "is not valid without a price" do
    #   expect(cat1.products.create(name: "Kendall",
    #     description: "hihi",
    #     price: nil,
    #     quantity: 3,
    #   ).errors.full_messages[0]).to eq "Price cents is not a number"      
    # end

    # it "is not valid without a quantity" do
    #   expect(cat1.products.create(name: "Kendall",
    #     description: "hihi",
    #     price: 10,
    #     quantity: nil,
    #   ).errors.full_messages[0]).to eq "Quantity can't be blank"      
    # end

    # it "is not valid without a category" do
    #   expect(Product.create(name: "Kendall",
    #     description: "hihi",
    #     price: 10,
    #     quantity: 3,
    #   ).errors.full_messages[0]).to eq "Category can't be blank"      
    # end

  end
end
