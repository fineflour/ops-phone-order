Rails.application.routes.draw do

  # Root of the app
  root 'twilio#index'

  # webhook for your Twilio number
  match 'ivr/welcome' => 'twilio#ivr_welcome', via: [:get, :post], as: 'welcome'

  # callback for user entry
  match 'ivr/selection' => 'twilio#menu_selection', via: [:get, :post], as: 'menu'

  # callback for planet entry
  match 'ivr/planets' => 'twilio#planet_selection', via: [:get, :post], as: 'planets'

  match 'ivr/first_name' => 'twilio#first_name', via: [:get, :post], as: 'first_name'
  match 'ivr/last_name' => 'twilio#last_name', via: [:get, :post], as: 'last_name'

end
