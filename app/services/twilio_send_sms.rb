class TwilioSendSms
  cattr_accessor :client
  self.client = Twilio::REST::Client

  def initialize
    @client = self.class.client.new(
      ENV.fetch('TWILIO_ACCOUNT_SID'),
      ENV.fetch('TWILIO_AUTH_TOKEN'),
    )
  end

  def send_message(from_phone, number, message)
    @client.messages.create(
      from: from_phone,
      to: "+55#{number}",
      body: message,
    )
  end
end
