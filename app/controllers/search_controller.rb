class SearchController < ApplicationController

  def index
    zip = params[:q]
    raw_stations = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&location=zip").body
    parsed_stations = JSON.parse(raw_stations)
    binding.pry
  end

end
