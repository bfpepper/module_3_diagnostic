class SearchController < ApplicationController

  def index
    @zip = params[:q]
    @stations = Station.all_by(params)
  end

end
