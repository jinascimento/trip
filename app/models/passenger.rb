class Passenger < ApplicationRecord
  before_save :occupy_armchair
  before_destroy :vacate_armchair
  belongs_to :bus, optional: true

  def occupy_armchair
    bus = Bus.find(bus_id)
    bus.update(armchair: bus.armchair -= 1)
  end

  def vacate_armchair
    bus = Bus.find(bus_id)
    bus.update(armchair: bus.armchair += 1)
  end
end
