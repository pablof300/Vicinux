class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :exchange, foreign_key: true
      t.integer :meta_id

      t.timestamps
    end
  end
end
