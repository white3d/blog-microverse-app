class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :Name, presence: true, allow_blank: false
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.includes(:AuthorId).order(created_at: :DESC).limit(3)
  end
end
