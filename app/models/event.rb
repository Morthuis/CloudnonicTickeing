class Event < ApplicationRecord
  after_update :recalculate_total_price_for_users, if: :ticket_price_changed?
  has_many :tickets
  belongs_to :user
  validates :name, uniqueness: true
  validates :tickets_threshold, numericality: { greater_than: 0 }
  validates :ticket_price, numericality: { greater_than: 0 }




  def tickets_available?(quantity)
    tickets.pluck(:quantity).sum + quantity <= tickets_threshold
  end

  def tickets_remind
    tickets_threshold - tickets.pluck(:quantity).sum
  end

  private

  def ticket_price_changed?
    saved_change_to_ticket_price?
  end

  def recalculate_total_price_for_users
    tickets.each { |ticket| ticket.update!(total_price: ticket.quantity * ticket_price) }
  end
end
