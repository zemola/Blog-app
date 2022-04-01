require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'Tom.png', bio: 'Teacher from Mexico.')
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'check if the title is not blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'return when there is no comments yet for a post' do
    expect(Comment.first).to eql nil
  end

  it 'return all the comments for a post' do
    expect(Comment.count).to eql 0
  end

  describe 'Should test methods in post model' do
    it 'Should retun the recent comments' do
      expect(subject.recent_comments).to eq(subject.comments.last(5))
    end
  end

  describe 'Should test methods in post model' do
    it 'Should retun the update post' do
      expect(Post.count).to eq 0
    end
  end
end
