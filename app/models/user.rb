require 'bcrypt'
require "securerandom"

class User < ActiveRecord::Base
  attr_accessible :name, :username, :password#, :friend_ids

  validates :name, :username, :password_digest, presence: true
  validates :username, uniqueness: true

  has_many :friend_circles
  has_many :friend_memberships, through: :friend_circles, source: :memberships
  has_many :friends,
  :class_name => "FriendCircleMembership",
  :foreign_key => :friend_id

  has_many :posts, foreign_key: :author_id

  #accepts_nested_attributes_for :friend

  # def friends
#     self.friend_memberships.map do |mem_record|
#       id = mem_record.friend_id
#       User.find(id)
#     end
#   end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def logout!
    self.session_token = nil
    self.save!

  end
end
