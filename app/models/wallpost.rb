class Wallpost < ApplicationRecord
  belongs_to :user
  has_many :wallpostcomments
  validates :content, presence: true
  before_create :render_likes

  def render_likes
    self.likes = 0 
  end
end
