class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :user_id, :friend_ids #, :memberships_attributes

  validates :name, :user_id, presence: true

  belongs_to :user
  has_many :memberships,
          :class_name => "FriendCircleMembership",
          :foreign_key => :circle_id

  has_many :friends,
  :through => :memberships, :source => :friend

  has_many :post_circles, foreign_key: :circle_id

  #accepts_nested_attributes_for :memberships
end