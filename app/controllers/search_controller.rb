class SearchController < ApplicationController

  def index
    @stations = StationFinderServices.new(params[:q]).get_stations
    @zip = params[:q]
  end

end
