class AddColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :users,:follower,:string
  	add_column :users,:followed,:string
  end
end
