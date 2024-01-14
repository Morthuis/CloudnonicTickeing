class Ticket < ApplicationRecord
  after_update :recalculate_total_price, if: :quantity_changed?
  validates :quantity, numericality: { greater_than: 0 }
  belongs_to :event
  belongs_to :user

  private

  def quantity_changed?
    saved_change_to_quantity?
  end

  def recalculate_total_price
    update!(total_price: quantity * event.ticket_price)
  end
end
