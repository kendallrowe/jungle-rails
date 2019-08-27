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

    it "is not valid if user with email already exists" do
      subject.save
      duplicate_email_user = User.create(first_name: "Copy",
        last_name: "Cat",
        email: "kendall.rowe312@gmail.com",
        password: "1234",
        password_confirmation: "1234"
      ) 
      expect(duplicate_email_user).to_not be_valid
    end


    it "is not valid without an email" do
      subject.email = nil
      expect { subject.save }.to raise_error
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect { subject.save }.to raise_error
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect { subject.save }.to raise_error
    end

  end
end
