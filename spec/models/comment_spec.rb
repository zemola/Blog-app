require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    @user = User.new(name: 'Jack', photo: 'Tom.png', bio: 'Teacher from DRC')
    Comment.new(text: 'Hello', author: @user, id: 4)
  end

  before { subject.save }

  it 'should return the right comments' do
    expect(subject.text).to eq 'Hello'
  end
end
