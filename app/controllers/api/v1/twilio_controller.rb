# app/controllers/api/v1/twilio_controller.rb

class Api::V1::TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def webhook
    render json: { message: "Webhook received" }, status: :ok
  end
end
