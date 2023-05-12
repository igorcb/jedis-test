class Address < ApplicationRecord
  belongs_to :municipe

  validates :zip_code, :street, :number, :neighborhood, :city, :state, presence: true
end
