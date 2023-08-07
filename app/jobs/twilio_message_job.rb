class TwilioMessageJob < ApplicationJob
  queue_as :default

  def perform(phone_number, body)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(body: body, from: twilio_phone_number, to: phone_number)
  end
end
