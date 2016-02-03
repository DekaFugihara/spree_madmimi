Spree::Core::Engine.routes.draw do
	namespace :madmimi do
		post 'subscribe', :as => :subscribe
		get 'success'
	end
end
