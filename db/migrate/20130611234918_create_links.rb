class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url_address

      t.timestamps
    end
  end
end
