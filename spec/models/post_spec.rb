require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'ActiveRecord associations' do
    it 'Should have many comments' do
      expect(Post.reflect_on_association(:comments).macro).to be(:has_many)
    end

    it 'Should belong to a user' do
      expect(Post.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end

  context 'Validations' do
    user = User.create(
      first_name: 'jane',
      last_name: 'doe',
      email: 'jane@mail.com',
      time_zone: 'UTC',
      password: 'test',
      password_confirmation: 'test'
    )

    it 'Should error if a title is missing' do
      post = Post.create(user_id: 1, title: nil, content: 'How is everybody doing?')
      expect(post).to_not be_valid
    end

    it 'Should error if content is missing' do
      post = Post.create(user_id: 1, title: 'Hello World', content: nil)
      expect(post).to_not be_valid
    end

    it 'Should not error if all fields are filled out correctly' do
      post = Post.create(user_id: 1, title: 'Hello World', content: 'How is everybody doing?')
      expect(post).to be_valid
    end
  end
end
