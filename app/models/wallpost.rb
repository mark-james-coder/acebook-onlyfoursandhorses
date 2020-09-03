class Wallpost < ApplicationRecord
  belongs_to :user
  has_many :wallpostcomments
  validates :content, presence: true
end
