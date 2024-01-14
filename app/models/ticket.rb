class Ticket < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0 }
  belongs_to :event
end
