class Passenger < ApplicationRecord
  belongs_to :bus, optional: true
end
