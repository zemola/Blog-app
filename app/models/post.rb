class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
