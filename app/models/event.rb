class Event < ApplicationRecord
  has_many :buses, dependent: :destroy

  accepts_nested_attributes_for :buses
end
