class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(station)
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_type = station[:fuel_type_code]
    @distance = station[:distance]
    @access_times = station[:access_days_time]
  end

  def self.all_by(params)
    stations = StationFinderServices.new.get_stations(params[:q])
    stations[:fuel_stations].map do |station|
      Station.new(station)
    end
  end
end
