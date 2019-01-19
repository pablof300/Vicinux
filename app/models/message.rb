class Message < ApplicationRecord
  validates :body, presence: true, length: { minimum: 5 }
  belongs_to :exchange
end
