class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.boolean :open
      t.integer :meta_id

      t.timestamps
    end
  end
end
