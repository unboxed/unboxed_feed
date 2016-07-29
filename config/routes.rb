Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'content_items#index'

  get 'content_items/filtered' => 'content_items#filtered'

  namespace :admin do
		resources :content_items, only: [:index, :edit, :show, :update]
	end
end
