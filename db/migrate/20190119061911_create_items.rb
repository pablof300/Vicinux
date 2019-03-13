class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :icon
      t.date :date
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
