class ZoneIdentifier
  attr_accessor :source_zone, :destination_zone

  def self.indentifier(source_zone, destination_zone)
    self.new(source_zone, destination_zone).indentifier
  end

  def initialize(source_zone, destination_zone)
    @source_zone = source_zone
    @destination_zone = destination_zone
  end

  def include_zone1?
    [source_zone, destination_zone].include?(1)
  end

  def exclude_zone1?
    ![source_zone, destination_zone].include?(1)
  end

  def same_zone?
    (source_zone == destination_zone)
  end

  def different_zone?
    (source_zone != destination_zone)
  end

  def indentifier
    if same_zone? && include_zone1?
      :anywhere_in_zone1
    elsif same_zone? && exclude_zone1?
      :any_one_zone_outside_zone1
    elsif different_zone? && include_zone1?
      :any_two_zones_including_zone1
    elsif different_zone? && exclude_zone1?
      :any_two_zones_excluding_zone1
    end
  end
end