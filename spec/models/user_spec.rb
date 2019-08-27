require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(first_name: "Kendall",
    last_name: "Rowe",
    email: "kendall.rowe312@gmail.com",
    password: "123456",
    password_confirmation: "123456"
  )}
    
  describe "Validations" do
    it "is valid with valid attributes" do
      subject.save
      expect(subject).to be_valid
    end
    
    context "passwords" do
      it "is not valid with not matching password_confirmation" do
        subject.password_confirmation = "654321"
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
        password: "123456",
        password_confirmation: "123456"
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

    it "is not valid if password is less than 5 characters" do
      subject.password = "123"
      subject.password_confirmation = "123"
      subject.save
      expect(subject.errors.full_messages[0]).to eql("Password is too short (minimum is 5 characters)")
    end

  end

  describe ".authenticate_with_credentials" do
    subject { described_class.new(first_name: "Kendall",
      last_name: "Rowe",
      email: "kendall.rowe312@gmail.com",
      password: "123456",
      password_confirmation: "123456"
    )}  

    it "is valid with correct email and password" do
      subject.save
      expect(User.authenticate_with_credentials(
        "kendall.rowe312@gmail.com",
        "123456" 
      )).to_not be_nil
    end

    it "is not valid with incorrect email and correct password" do
      subject.save
      expect(User.authenticate_with_credentials(
        "kendall.rowe312@gmail.co",
        "123456" 
      )).to be_nil
    end

    it "is not valid with correct email and incorrect password" do
      subject.save
      expect(User.authenticate_with_credentials(
        "kendall.rowe312@gmail.com",
        "12345" 
      )).to be_nil
    end
  end
end
