class Bus < ApplicationRecord
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
