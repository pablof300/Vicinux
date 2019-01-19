class Exchange < ApplicationRecord
  has_many :exchange_joins
  has_many :users, through: :exchange_joins
  has_many :messages
end
