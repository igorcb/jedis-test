require 'rails_helper'

RSpec.describe TwilioSendSms, type: :service do
  subject(:twilio) { described_class.new }

  let(:message) { 'Welcome to Jedis Proj - Test' }
  let(:number) { '11111111111' }
  let(:from_phone) { ENV.fetch('TWILIO_PHONE_NUMBER') }

  describe '#call' do
    it 'send sms' do
      response = FakeSMS.messages.last
      expect(response).to eq(nil)
    end
  end
end