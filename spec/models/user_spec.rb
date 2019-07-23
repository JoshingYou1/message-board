require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveRecord associations' do
    it 'Should have many posts' do
      expect(User.reflect_on_association(:posts).macro).to be(:has_many)
    end

    it 'Should have many comments' do
      expect(User.reflect_on_association(:comments).macro).to be(:has_many)
    end
  end

  context 'Validations' do
    it 'Should error if email is missing' do
      new_user = User.new
      new_user.first_name = 'john'
      new_user.last_name = 'doe'
      new_user.email = ''
      new_user.password = 'test'
      new_user.password_confirmation = 'test'
      expect(new_user).to_not be_valid
    end

    it 'Should error if first_name is missing' do
      new_user = User.new
      new_user.first_name = ''
      new_user.last_name = 'doe'
      new_user.email = 'john@mail.com'
      new_user.password = 'test'
      new_user.password_confirmation = 'test'
      expect(new_user).to_not be_valid
    end

    it 'Should error if last_name is missing' do
      new_user = User.new
      new_user.first_name = 'john'
      new_user.last_name = ''
      new_user.email = 'john@mail.com'
      new_user.password = 'test'
      new_user.password_confirmation = 'test'
      expect(new_user).to_not be_valid
    end

    it 'Should error if password is mising' do
      new_user = User.new
      new_user.first_name = 'john'
      new_user.last_name = 'doe'
      new_user.email = 'john@mail.com'
      new_user.password = ''
      expect(new_user).to_not be_valid
    end

    it 'Should error if password confirmation does not match' do
      new_user = User.new
      new_user.first_name = 'john'
      new_user.last_name = 'doe'
      new_user.email = 'john@mail.com'
      new_user.password = 'test'
      new_user.password_confirmation = 'test1'
      expect(new_user).to_not be_valid
    end

    it 'Should be valid if all fields are entered correctly' do
      new_user = User.new
      new_user.first_name = 'john'
      new_user.last_name = 'doe'
      new_user.email = 'john@mail.com'
      new_user.password = 'test'
      new_user.password_confirmation = 'test'
      expect(new_user).to be_valid
    end
  end
end
