class SearchController < ApplicationController

  def index
    binding.pry
    @stations = StationFinderServices.new(params[:q]).get_stations
  end

end
