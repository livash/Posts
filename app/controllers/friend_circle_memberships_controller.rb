class FriendCircleMembershipsController < ApplicationController
  include ApplicationHelper
  before_filter :verify_user
end
