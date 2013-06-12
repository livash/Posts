class Link < ActiveRecord::Base
  attr_accessible :url_address

  has_many :post_shares
end
