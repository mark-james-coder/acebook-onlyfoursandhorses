class Wallpostcomment < ApplicationRecord
  belongs_to :wallpost 
  
  validates :content, presence: true
end
