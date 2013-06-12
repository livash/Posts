class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :friend_id#, :friend_ids

  validates :circle_id, :friend_id, presence: true

  belongs_to :friend_circle,
  :class_name => "FriendCircle",
  :foreign_key => :circle_id

  belongs_to :friend,
  :class_name => "User",
  :foreign_key => :friend_id
end
