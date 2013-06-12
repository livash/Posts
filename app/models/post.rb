class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title, :links_attributes, :circle_ids

  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :post_shares
  has_many :links, through: :post_shares
  has_many :post_circles
  has_many :circles, through: :post_circles

  accepts_nested_attributes_for :links
end
