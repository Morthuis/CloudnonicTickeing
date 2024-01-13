class Event < ApplicationRecord
  after_update :recalculate_total_price_for_users, if: :ticket_price_changed?
  has_many :tickets
  belongs_to :user



  private

  def ticket_price_changed?
    saved_change_to_ticket_price?
  end

  def recalculate_total_price_for_users
    print ">>>>>>>>>>>>>>>>#{self.ticket_price}<<<<<<<<<<<<<<<<<<<<"
  end
end
