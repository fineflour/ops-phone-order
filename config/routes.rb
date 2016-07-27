Rails.application.routes.draw do

  # Root of the app
  root 'twilio#index'

  # webhook for your Twilio number
  match 'ivr/welcome' => 'twilio#ivr_welcome', via: [:get, :post], as: 'welcome'

  # callback for planet entry
  match 'ivr/planets' => 'twilio#planet_selection', via: [:get, :post], as: 'planets'
  match 'ivr/first_name' => 'twilio#first_name', via: [:get, :post], as: 'first_name'
  match 'ivr/last_name' => 'twilio#last_name', via: [:get, :post], as: 'last_name'
  match 'ivr/zipcode' => 'twilio#zipcode', via: [:get, :post], as: 'zipcode'
  match 'ivr/street_address' => 'twilio#street_address', via: [:get, :post], as: 'street_address'
  match 'ivr/city' => 'twilio#city', via: [:get, :post], as: 'city'
  match 'ivr/state' => 'twilio#state', via: [:get, :post], as: 'state'
  match 'ivr/telephone' => 'twilio#telephone', via: [:get, :post], as: 'telephone'
  match 'ivr/email' => 'twilio#email', via: [:get, :post], as: 'email'
  match 'ivr/city' => 'twilio#city', via: [:get, :post], as: 'city'
  match 'ivr/thankyou' => 'twilio#thankyou', via: [:get, :post], as: 'thankyou'

end
