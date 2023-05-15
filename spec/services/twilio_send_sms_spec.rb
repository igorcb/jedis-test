require 'rails_helper'
# require 'models/fake_sms'

RSpec.describe TwilioSendSms, type: :service do
  subject(:twilio) { described_class.new(message, number) }

  let(:message) { 'Welcome to Jedis Proj - Test' }
  let(:number) { '85996670236' }

  describe '#call' do
    it 'send sms' do
      response = twilio.call
      expect(response.body).to include(message)
    end
  end
end