class PostCircle < ActiveRecord::Base
  attr_accessible :circle_id, :post_id

  belongs_to :post
  belongs_to :circle, class_name: "FriendCircle", foreign_key: :circle_id
end
