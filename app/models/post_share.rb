class PostShare < ActiveRecord::Base
  attr_accessible :link_id, :post_id

  belongs_to :post
  belongs_to :link
end
