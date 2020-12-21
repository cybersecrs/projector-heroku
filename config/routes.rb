Rails.application.routes.draw do
  resources  :projects
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'projects#index'
end
