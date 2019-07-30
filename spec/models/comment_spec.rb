require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'ActiveRecord associations' do
    it 'Should belong to a post' do
      expect(Comment.reflect_on_association(:post).macro).to be(:belongs_to)
    end

    it 'Should belong to a user' do
      expect(Comment.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end

  context 'Validation' do
    user = User.create(
      first_name: 'jane',
      last_name: 'doe',
      email: 'jane@mail.com',
      time_zone: 'UTC',
      password: 'test',
      password_confirmation: 'test'
    )
    post = Post.create(user_id: 1, title: 'The bird is the word', content: 'Have you not heard?')

    it 'Should error if content text is missing' do
      comment = Comment.create(user_id: 1, post_id: 1, comment_text: nil)
      expect(comment).to_not be_valid
    end

    it 'Should not error if content text is valid' do
      comment = Comment.create(user_id: 1, post_id: 1, comment_text: 'Hey, thanks for sharing!')
      expect(comment).to be_valid
    end
  end
end
