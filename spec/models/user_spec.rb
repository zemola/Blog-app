require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { User.new(name: 'Tom', photo: 'Tom.png', bio: 'Teacher from Mexico.') }

    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'return all the posts for a user' do
      expect(User.count).to eql 0
    end
  end

  describe 'Should test recent post method' do
    before { 4.times { |post_nb| Post.create(author_id: subject.id, title: "This is post #{post_nb}") } }

    it 'User should have three recent posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
