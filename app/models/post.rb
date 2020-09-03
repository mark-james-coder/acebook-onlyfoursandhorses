class Post < ApplicationRecord
  belongs_to :user
  has_many :postcomments
  before_create :render_likes

  def render_likes
    self.likes = 0 
  end
end
