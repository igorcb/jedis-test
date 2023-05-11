class Municipe < ApplicationRecord
  EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :name, :cpf, :cns, :phone, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }

  validate :cpf_is_valid?, :birth_date_valid?

  def cpf_is_valid?
    return errors.add(:cpf, 'CPF invalid') unless CPF.valid?(cpf)
  end

  def birth_date_valid?
    return errors.add(:birth_date, "can't be blank") if birth_date.blank?

    year = birth_date.year
    actual_year = Time.zone.now.year

    if year > actual_year
      return errors.add(:birth_date, 'invalid')
    end

    return errors.add(:birth_date, 'invalid') if (actual_year - year) > 100
  end
end
