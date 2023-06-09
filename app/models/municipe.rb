class Municipe < ApplicationRecord
  include Cns
  EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_one_attached :image

  validates :name, :cpf, :cns, :phone, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }

  validate :cpf_is_valid?, :birth_date_valid?, :cns_is_valid?

  after_create :send_welcome
  after_update :send_welcome

  def cpf_is_valid?
    return errors.add(:cpf, 'is invalid') unless CPF.valid?(cpf)
  end

  def cns_is_valid?
    return errors.add(:cns, 'CNS invalid') unless Cns.validate(cns)
  end

  def birth_date_valid?
    return errors.add(:birth_date, "can't be blank") if birth_date.blank?

    year = birth_date.year
    actual_year = Time.zone.now.year

    if year > actual_year
      return errors.add(:birth_date, 'is invalid')
    end

    return errors.add(:birth_date, 'is invalid') if (actual_year - year) > 100
  end

  def send_welcome
    Thread.new do
      ApplicationMailer.welcome(self).deliver_now
      TwilioSendSms.new.send_message(
        ENV.fetch('TWILIO_PHONE_NUMBER'),
        phone,
        'Welcome to Jedis Proj',
      )
    end
  end
end
