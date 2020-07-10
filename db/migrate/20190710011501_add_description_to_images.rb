class AddDescriptionToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :description, :string
  end
end
