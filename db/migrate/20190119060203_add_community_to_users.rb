class AddCommunityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :community_id, :integer
  end
end
