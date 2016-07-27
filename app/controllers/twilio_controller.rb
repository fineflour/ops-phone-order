require 'twilio-ruby'
require 'sanitize'


class TwilioController < ApplicationController

  def index
    render text: "Dial Me."
  end

  # POST ivr/welcome
  def ivr_welcome
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-019.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '10', action: first_name_path     
    end
    render text: response.text
  end

  def first_name
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-020.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: last_name_path     
    end
    render text: response.text
  end


  def last_name
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-021.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: zipcode_path
    end
    render text: response.text
  end

  def zipcode
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-022.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: street_address_path 
    end
    render text: response.text
  end

  def street_address
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-024.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: city_path
    end
    render text: response.text
  end

  def city
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-025.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: state_path
    end
    render text: response.text
  end


  def state
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-026.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: telephone_path
    end
    render text: response.text
  end


  def telephone
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-028.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: email_path
    end
    render text: response.text
  end

  def email
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-030.mp3"
      r.Record finishOnKey: "#", playBeep: true, maxLength: '20', CallStatus: 'in-progress', action: thankyou_path
    end
    render text: response.text
  end


  def thankyou
    response = Twilio::TwiML::Response.new do |r|
      r.Play "http://75.119.204.130/ivr/english_prompts/STE-037.mp3"
      r.Hangup 
    end
    render text: response.text
  end
end
