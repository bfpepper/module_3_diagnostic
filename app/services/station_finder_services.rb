class StationFinderServices

  def initialize
    @connection = Faraday.new(url: "http://developer.nrel.gov")
    @connection.params['api_key'] = "#{ENV['nrel_key']}"
  end

  def get_stations(zip_code)
    response = @connection.get '/api/alt-fuel-stations/v1/nearest', {
      format: "json",
      location: "#{zip_code}",
      radius: "6",
      fuel_type: "ELEC,LPG",
      limit: "10"
    }
    JSON.parse(response.body, symbolize_names: true)
  end



end
