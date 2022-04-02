require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    @user = User.new(name: 'Jack', photo: 'Tom.png', bio: 'bio')
    Post.new(title: 'RoR', text: 'Hello', likes_counter: 1, author: @user, id: 4)
  end

  before { subject.save }

  it 'should return the number of likes' do
    subject.likes.new(author: @user, post: subject)
    expect(subject.likes_counter).to eql 1
  end
end
