class Comment < ApplicationRecord
  validates :content, presence: true

  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :post 
end
