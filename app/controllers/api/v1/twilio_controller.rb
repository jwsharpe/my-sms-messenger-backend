# app/controllers/api/v1/twilio_controller.rb

class Api::V1::TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def webhook
    # Search for the most recent message with matching "to" phone number and "body"
    recent_message = Message.where(phone_number: params[:to], body: params[:body]).order(created_at: :desc).first

    if recent_message.present?
      recent_message.update(status: "SENT")

      render json: { message: "Webhook received, matching messages found, and status updated" }, status: :ok
    else
      render json: { message: "Webhook received but no matching messages found" }, status: :ok
    end
  end
end
