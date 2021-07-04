class Message < ApplicationRecord
  validates :content, presence: true

  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :room
end
