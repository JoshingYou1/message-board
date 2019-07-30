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
    subject { 
      described_class.new(
        first_name: 'john',
        last_name: 'doe',
        email: 'JDoe@mail.com',
        time_zone: 'UTC',
        password: 'test',
        password_confirmation: 'test'
      )
    }
    it 'Should error if email is missing' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'Should error if first_name is missing' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'Should error if last_name is missing' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'Should error if password is mising' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'Should error if password confirmation does not match' do
      subject.password_confirmation = 'test1'
      expect(subject).to_not be_valid
    end

    it 'Should be valid if all fields are entered correctly' do
      # Must use a new email due to uniqeness attr
      subject.email = 'J@mail.com'
      expect(subject).to be_valid
    end
  end
end
