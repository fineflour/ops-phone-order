require 'twilio-ruby'
require 'sanitize'


class TwilioController < ApplicationController
  
  def index
    render text: "Dial Me."
  end

  # POST ivr/welcome
  def ivr_welcome
    response = Twilio::TwiML::Response.new do |r|
      r.Gather finishOnKey: '#', action: menu_path do |g|
        g.Play "https://75.119.204.130/ivr/english_prompts/STE-019.mp3", loop: 1
        g.Record finishOnKey: '#', playBeep: "true"
      end
    end
    render text: response.text
  end

  # GET ivr/selection
  def menu_selection
    user_selection = params[:Digits]

    case user_selection
    when "#"
    response = Twilio::TwiML::Response.new do |r|
      r.Gather finishOnKey: '#', action: menu_path do |g|
        g.Play "https://75.119.204.130/ivr/english_prompts/STE-020.mp3", loop: 1
        g.Record finishOnKey: '#', playBeep: "true"
      end
    end
    render text: response.text
    when "2"
      list_planets
    else
      @output = "Returning to the main menu."
      twiml_say(@output)
    end

  end

  # POST/GET ivr/planets 
  # planets_path
  def planet_selection
    user_selection = params[:Digits]

    case user_selection
    when "2"
      twiml_dial("+12024173378")
    when "3"
      twiml_dial("+12027336386")
    when "4"
      twiml_dial("+12027336637")
    else
      @output = "Returning to the main menu."
      twiml_say(@output)
    end
  end

  private

  def list_planets
    message = "To call the planet Broh doe As O G, press 2. To call the planet
    DuhGo bah, press 3. To call an oober asteroid to your location, press 4. To
    go back to the main menu, press the star key."

    response = Twilio::TwiML::Response.new do |r|
      r.Gather numDigits: '1', action: planets_path do |g|
        g.Say message, voice: 'alice', language: 'en-GB', loop:3
      end
    end

    render text: response.text
  end

  def twiml_say(phrase, exit = false)
    # Respond with some TwiML and say something.
    # Should we hangup or go back to the main menu?
    response = Twilio::TwiML::Response.new do |r|
      r.Say phrase, voice: 'alice', language: 'en-GB'
      if exit 
        r.Say "Thank you for calling the ET Phone Home Service - the
        adventurous alien's first choice in intergalactic travel."
        r.Hangup
      else
        r.Redirect welcome_path
      end
    end

    render text: response.text
  end

  def twiml_dial(phone_number)
    response = Twilio::TwiML::Response.new do |r|
      r.Dial phone_number
    end

    render text: response.text
  end
end
