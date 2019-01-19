class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.integer :zipcode

      t.timestamps
    end
  end
end
