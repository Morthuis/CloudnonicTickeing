require 'rails_helper'

RSpec.describe "CloudnonicTicketing API", type: :request do
  fixtures :users, :events, :users

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Events<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  describe 'GET /api/v1/events Provide a list of all events' do
    it 'returns a successful response' do
      get '/api/v1/events', params: {}

      expect(response).to have_http_status(200)
    end

    it 'Return 3 events' do
      get '/api/v1/events', params: {}

      json_response = JSON.parse(response.body)
      expect(json_response['data'].length).to eq(3) #Check test/fixtures/events.rb
    end
  end

  describe 'GET /api/v1/events/:event_id Provide a single event details' do
    it 'returns a successful response' do
      get '/api/v1/events/1', params: {}

      expect(response).to have_http_status(200)
    end

    it 'Return a single event with id = 1' do
      get '/api/v1/events/1', params: {}

      json_response = JSON.parse(response.body)
      expect(json_response['data']['id']).to eq(1)
    end

    it 'The event description must be: You will be able to spent time with you friends and 1' do
      get '/api/v1/events/1', params: {}

      json_response = JSON.parse(response.body)
      expect(json_response['data']['description']).to eq('You will be able to spent time with you friends and 1')
    end
  end

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Tickets<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  describe 'GET tickets_availability/:event_id Provide the tickets availability of an event' do
    it 'returns a successful response' do
      get '/api/v1/tickets_availability/2', params: {}

      expect(response).to have_http_status(200)
    end

    it 'Return 110 tickets (taking into account that Moises one bought 10 tickets, check => test/fixtures/tickets.rb) ' do
      get '/api/v1/tickets_availability/2', params: {}

      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq('There are 110 tickets remind for The best event 2')
    end

    it 'Ask for an unexist event_id [Event not found]' do
      get '/api/v1/tickets_availability/999', params: {}

      expect(response).to have_http_status(404)
      json_response = JSON.parse(response.body)
      expect(json_response['data']['message']).to eq('Event not found')
    end
  end

  describe 'GET /api/v1/event_tickets/:event_id Provide a list of tickets related to an event' do
    it 'returns a successful response' do
      get '/api/v1/event_tickets/2', params: {}

      expect(response).to have_http_status(200)
    end

    it 'It must provided 2 elements' do
      get '/api/v1/event_tickets/2', params: {}

      json_response = JSON.parse(response.body)
      expect(json_response['data'].length).to eq(2)
    end

    it 'Ask for an unexist event_id [Event not found]' do
      get '/api/v1/event_tickets/999', params: {}

      expect(response).to have_http_status(404)
      json_response = JSON.parse(response.body)
      expect(json_response['data']['message']).to eq('Event not found')
    end
  end

end
