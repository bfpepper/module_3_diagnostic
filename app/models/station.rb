class Station

  def initialize(station)
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_type = station[:fuel_type_code]
    @distance = station[:distance]
    @access_times = station[:access_days_time]
  end

end
