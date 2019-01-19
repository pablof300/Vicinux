class ModifyIconsInItems < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :icon, :string
    remove_column :users, :icon
  end
end
