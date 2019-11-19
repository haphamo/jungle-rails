require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.create(name: "Ha Pham", email: "ha.phamo@hotmail.com", password: '12345', password_confirmation: '12345')
    end
    it 'is valid with password and password confirmation' do
      expect(@user).to be_valid
    end

    it 'is not valid when password and password confirmation do not match' do
      @user.password_confirmation = '11234'
      expect(@user).to_not be_valid
    end

    it 'is not valid when the email already exists' do
      user2 = User.create(name: "Another Pham", email: "HA.PHAMO@HOTMAIL.COM", password: '12345', password_confirmation: '12345')
      expect(user2).to_not be_valid
    end

    it 'is not valid if name is empty' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is empty' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is empty' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is shorter than 5 characters' do
     @user.password = "asdf"
     @user.password_confirmation = "asdf"
     expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # before(:each) do
    #  if User.find_by_email('ha.phamo@hotmail.com')
    #   User.find_by_email('ha.phamo@hotmail.com').delete
    #  end
    # end
    it 'will not log the user if it exists and the passwords not' do
      # find user in db
      User.create(name: "Ha Pham", email: "ha.phamo@hotmail.com", password: '12345', password_confirmation: '12345')
      result = User.authenticate_with_credentials('ha.phamo@hotmail.com', '12322')
      expect(result).to be_nil
    end

    it 'will log the user if it exists and the passwords match' do
      User.create(name: "Ha Pham", email: "ha.phamo@hotmail.com", password: '12345', password_confirmation: '12345')
      result = User.authenticate_with_credentials('ha.phamo@hotmail.com', '12345')
      expect(result).to be_truthy
    end

    it 'should still authenicate and allow the user to log in if there are spaces in the email' do
      User.create(name: "Ha Pham", email: "ha.phamo@hotmail.com", password: '12345', password_confirmation: '12345')
      result = User.authenticate_with_credentials('  ha.phamo@hotmail.com', '12345')
      expect(result).to be_truthy
    end

    it 'should still authenicate and allow the user to log in if there are spaces in the email' do
      User.create(name: "Ha Pham", email: "ha.phamo@hotmail.com", password: '12345', password_confirmation: '12345')
      result = User.authenticate_with_credentials('  Ha.PhamO@hotmail.com', '12345')
      expect(result).to be_truthy
    end
  end
end
