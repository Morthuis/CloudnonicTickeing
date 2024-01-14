require 'rails_helper'

RSpec.describe 'API V1 Routes', type: :routing do
  describe 'EventsController' do
    it 'routes to #index' do
      expect(get: '/api/v1/events').to route_to('api/v1/events#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/events/1').to route_to('api/v1/events#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/events').to route_to('api/v1/events#create')
    end

    it 'routes to #update' do
      expect(put: '/api/v1/events/1').to route_to('api/v1/events#update', id: '1')
    end
  end

  describe 'TicketsController' do
    it 'routes to #show' do
      expect(get: '/api/v1/tickets/1').to route_to('api/v1/tickets#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/tickets').to route_to('api/v1/tickets#create')
    end

    it 'routes to #update' do
      expect(put: '/api/v1/tickets/1').to route_to('api/v1/tickets#update', id: '1')
    end

    it 'routes to #tickets_list' do
      expect(get: '/api/v1/event_tickets/1').to route_to('api/v1/tickets#tickets_list', id: '1')
    end

    it 'routes to #tickets_availability' do
      expect(get: '/api/v1/tickets_availability/1').to route_to('api/v1/tickets#tickets_availability', id: '1')
    end
  end
end

RSpec.describe Api::V1::EventsController, type: :controller do
  user1 = FactoryBot.create(:user, email: 'morthuisater1@gmail.com', password: 'qwer1234', id: 1)
  event1 = FactoryBot.create(:event, name: 'event uno', location: 'vegas1', description: 'A new test event1', start_time: '2024-01-14 06:13:48.556', end_time: '2024-01-14 06:13:48.556', user_id: 1, ticket_price: 20, tickets_threshold: 200, id: 1)
  event2 = FactoryBot.create(:event, name: 'event dos', location: 'vegas2', description: 'A new test event2', start_time: '2024-01-14 06:13:48.556', end_time: '2024-01-14 06:13:48.556', user_id: 1, ticket_price: 20, tickets_threshold: 200, id: 2)
  event3 = FactoryBot.create(:event, name: 'event tres', location: 'vegas3', description: 'A new test event3', start_time: '2024-01-14 06:13:48.556', end_time: '2024-01-14 06:13:48.556', user_id: 1, ticket_price: 20, tickets_threshold: 200, id: 3)
  ticket1 = FactoryBot.create(:ticket, buyer_name: 'Moises H', quantity: 5, total_price: 300, event_id: 2, user_id: 1)
  ticket2 = FactoryBot.create(:ticket, buyer_name: 'Moises H', quantity: 5, total_price: 300, event_id: 2, user_id: 1)
  describe 'GET #show /api/v1/events/event_id' do
    it 'gets the information related to an specific event' do
      get :show, params: {'id': 2}

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json; charset=utf-8')

      json_response = JSON.parse(response.body)
      expect(json_response['data']['name']).to eq('event dos')

      get :show, params: {'id': "hola"}
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(404)
      expect(json_response['data']['message']).to eq('Event not found')
    end
  end

  describe 'GET #index /api/v1/events.json' do
    it 'gets a list of all events JSON' do
      get :index, params: {}

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json; charset=utf-8')

      json_response = JSON.parse(response.body)

      expect(json_response['data'].length).to eq(3) #event1, event2, event3
      expect(json_response['data'][0]['name']).to eq('event uno')
    end
  end
end

RSpec.describe Api::V1::TicketsController, type: :controller do
  describe 'GET #tickets_list event_tickets/id' do
    it 'Retrieve a list of ticket purchases for a specific event.' do
      get :tickets_list, params: { 'id': 2 }

      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response['data'].length).to eq(2)
    end
  end

  describe 'GET ##tickets_availability tickets_availability/event_id' do
    it 'Retrieve how many tickets are available for an event.' do
        get :tickets_availability, params: { 'id': 2 }

        expect(response).to have_http_status(200)
        json_response = JSON.parse(response.body)
        print json_response
        expect(json_response['data']).to eq('There are 190 tickets remind for event dos')
      end
  end
end
