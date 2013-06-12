class EditPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :circle_id
  end
end
