# app/controllers/api/v1/twilio_controller.rb

class Api::V1::TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  def webhook
    # Process Twilio webhook notification here
    # Update message status or perform other actions
    put "Webhook recieved"
    render plain: "Webhook received", status: :ok
  end
end
