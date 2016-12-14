class StationFinderServices
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
    @connection = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/")
  end

  def get_stations
    raw_stations = Faraday.get(@connection.get("nearest.json?api_key=#{ENV['nrel_key']}&location=zip").body
    binding.pry
    parsed_stations = JSON.parse(raw_stations)
    actual_stations = parsed_stations["fuel_stations"]
  end


end
