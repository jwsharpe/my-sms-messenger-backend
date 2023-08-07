class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  def index
    messages = current_devise_api_user.messages
    if messages.empty?
      render json: { message: "No messages found" }, status: :not_found
    else
      render json: messages, status: :ok
    end
  end

  def create
    phone_number = params[:phoneNumber]
    body = params[:message]

    if phone_number.blank? || body.blank?
      render json: { error: "Phone number and message cannot be empty" }, status: :bad_request
      return
    end

    new_message = current_devise_api_user.messages.new(phone_number: phone_number, body: body)

    if new_message.save
      TwilioMessageJob.perform_later(phone_number, body)

      render json: { message: "Message creation request enqueued" }, status: :created
    else
      render json: { error: new_message.errors.full_messages.join(", ") }, status: :bad_request
    end
  end
end
