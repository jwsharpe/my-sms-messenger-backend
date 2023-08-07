# app/controllers/api/v1/twilio_controller.rb

class Api::V1::TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def webhook
    recent_message = Message.where(phone_number: params[:To]).order(created_at: :desc).first

    if recent_message.present?
      status = params[:SmsStatus]
      recent_message.update(status: status.upcase)

      render json: { message: "Webhook received, matching messages found, and status updated" }, status: :ok
    else
      render json: { message: "Webhook received but no matching messages found" }, status: :ok
    end
  end
end
