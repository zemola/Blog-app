require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(1, 2) }
  end
end
