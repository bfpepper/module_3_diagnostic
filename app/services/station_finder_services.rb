class StationFinderServices
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
    @connection = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/")
  end

  def get_stations
    response = @connection.get("nearest.json?api_key=#{ENV['nrel_key']}&location=#{zip_code}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    actual_stations = parsed_response[:fuel_stations]
    all_stations = set_station_data(actual_stations)
    closest = order_distance(all_stations)
    correct_stations = find_correct_fuel(closest).pop(10)
  end

  def set_station_data(actual_stations)
    actual_stations.map do |station|
      Station.new(station)
    end
  end

  def order_distance(all_stations)
    all_stations.sort_by do |station|
      station.distance if station.distance < 6
    end
  end

  def find_correct_fuel(closest)
    closest.select do |station|
      station.fuel_type == "ELEC" || station.fuel_type == "LPG"
    end
  end

end
