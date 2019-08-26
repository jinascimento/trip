class Bus < ApplicationRecord
  has_many :passengers
  belongs_to :event
  accepts_nested_attributes_for :passengers
end
