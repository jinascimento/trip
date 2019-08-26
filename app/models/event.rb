class Event < ApplicationRecord
  has_many :buses

  accepts_nested_attributes_for :buses
end
