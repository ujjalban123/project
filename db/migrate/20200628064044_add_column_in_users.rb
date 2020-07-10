class AddColumnInUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users,:bio,:text
  	add_column :users,:phone,:string
  	add_column :users,:gender,:string
  end
end
