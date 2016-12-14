class StationFinderServices
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
    @connection = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/")
  end

  def get_stations
    raw_stations = @connection.get("nearest.json?api_key=#{ENV['nrel_key']}&location=#{@zip_code}").body
    parsed_stations = JSON.parse(raw_stations, symbolize_names: true)
    actual_stations = parsed_stations[:fuel_stations]
    all_stations = set_station_data(actual_stations)
    this = order_stations(all_stations)
    binding.pry
  end

  def set_station_data(actual_stations)
    actual_stations.map do |station|
      Station.new(station)
    end
  end

  def order_stations(all_stations)
    all_stations.sort_by do |station|
      station
    end
  end

end
