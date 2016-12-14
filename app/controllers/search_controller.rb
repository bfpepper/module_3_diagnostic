class SearchController < ApplicationController

  def index
    @stations = StationFinderServices.new(params[:q]).get_stations
  end

end
