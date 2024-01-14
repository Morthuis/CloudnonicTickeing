# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
for x in 1..5
  User.create!(email: "morthuisater#{x}@gmail.com", password: 'qwer1234', password_confirmation: 'qwer1234')
  for a in 1..12
    Event.create!(name: "Event#{a} #{x}", description: "Enjoy so much this event #{a} #{x}",start_time: Time.now, end_time: Time.now, ticket_price: 15 ,tickets_threshold: 800, user_id: x)
      for t in 1..10
        Ticket.create!(buyer_name: "Moises #{x}", quantity: t + 2, event_id: a, user_id: x)
      end
  end
end
