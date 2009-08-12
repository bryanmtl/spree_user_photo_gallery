# Put your extension routes here.

map.resources :submissions, :as => 'galleries'

map.resources :user_profiles do |user_profile|
 user_profile.resources :submissions, :as => 'galleries'
end
map.resources :products do |product|
  product.resources :submissions, :as => 'galleries'
end
map.namespace :admin do |admin|
  admin.resources :submissions
end  
