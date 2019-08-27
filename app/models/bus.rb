class Bus < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :event
  accepts_nested_attributes_for :passengers
end
