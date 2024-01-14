Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' }
      resources :events, except: %i[destroy new]
      resources :tickets, except: %i[index new destroy]
      get 'event_tickets/:id', to: 'tickets#tickets_list'
    end
  end
end
