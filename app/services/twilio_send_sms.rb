class TwilioSendSms
  attr_reader :message

  def initialize(message, number)
    @message = message
    @number = number
  end

  def call
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_PHONE_NUMBER']

    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create(
      from: twilio_number,
      to: "+55#{@number}",
      body: @message,
    )
  end
end
