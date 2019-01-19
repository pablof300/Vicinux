class CreateExchangeJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_joins do |t|
      t.integer :user_id
      t.integer :exchange_id
    end
  end
end
