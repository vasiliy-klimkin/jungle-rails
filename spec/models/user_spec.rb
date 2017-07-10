require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Passing User registration test" do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password"

      @user.save
      expect(@user.valid?).to be true
    end

    it "Password and password confirmation does not match" do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password1"

      @user.save
      expect(@user.valid?).to be false
    end

    it "Password is empty" do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = nil
      @user.password_confirmation = "password1"

      @user.save
      expect(@user.valid?).to be false
    end

    it "Password confirmation is empty" do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "password"
      @user.password_confirmation = '' # WHY NOT NIL

      @user.save
      expect(@user.valid?).to be false
    end

      it "2 Users same email" do
      @user1 = User.new
      @user1.first_name = "Vasiliy"
      @user1.last_name = "Klimkin"
      @user1.email = "vasily.klimkin@gmail.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"

      @user1.save

      @user2 = User.new
      @user2.first_name = "Vasiliy"
      @user2.last_name = "Klimkin"
      @user2.email = "vasily.klimkin@gmail.com"
      @user2.password = "password"
      @user2.password_confirmation = "password"

      @user2.save

      expect(@user2.valid?).to be false
    end

    it "User email is uppercased and lowercased" do
      @user1 = User.new
      @user1.first_name = "Vasiliy"
      @user1.last_name = "Klimkin"
      @user1.email = "vaSiLy.kLIMkiN@gmail.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"

      @user1.save
      @user2 = User.new
      @user2.first_name = "Vasiliy"
      @user2.last_name = "Klimkin"
      @user2.email = "vasily.klimkin@gmail.com"
      @user2.password = "password"
      @user2.password_confirmation = "password"

      @user2.save

      expect(@user2.valid?).to be false
    end

    it "Password is less than 8 characters" do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "1234567"
      @user.password_confirmation = '1234567'
      @user.save
      expect(@user.valid?).to be false
    end

    it "Password is less than 8 characters" do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "1234567"
      @user.password_confirmation = '1234567'
      @user.save
      expect(@user.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    it 'Authenticates correctly' do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password"

      @user.save

      user_logged = User.authenticate_with_credentials('vasily.klimkin@gmail.com', 'password')

      expect(user_logged).to be_eql @user
    end

    it 'User does not exist and should return nil' do
      user_logged = User.authenticate_with_credentials('vasily.klimkin@gmail.com', 'password')
      expect(user_logged).to be nil
    end

    it 'User email is with extra spaces: expected to login' do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save
      user_logged = User.authenticate_with_credentials('vasily.klimkin@gmail.com', 'password')

      #puts " LOOK HERE #{user_logged.inspect}"
      expect(user_logged).to be_eql @user
    end

    it 'User has lower and upcase letters' do
      @user = User.new
      @user.first_name = "Vasiliy"
      @user.last_name = "Klimkin"
      @user.email = "vasily.klimkin@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save
      user_logged = User.authenticate_with_credentials('VaSily.kLImkin@gmail.com', 'password')
      expect(user_logged).to be_eql @user
    end
  end


end


