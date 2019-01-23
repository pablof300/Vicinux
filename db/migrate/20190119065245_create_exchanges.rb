class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.integer :meta_id
      t.boolean :open
      t.boolean :incomplete

      t.timestamps
    end
  end
end
