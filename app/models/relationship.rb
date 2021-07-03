class Relationship < ApplicationRecord
  belongs_to :follower,  class_name: 'User'
  belongs_to :following, class_name: 'User'

  validates :following, uniqueness: { scope: :follower }
  validates :follower,  uniqueness: { scope: :following }
end
