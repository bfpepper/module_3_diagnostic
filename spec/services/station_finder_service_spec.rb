require "rails_helper"

describe "station Finder service" do
  it "returns a list of stations with given data" do
    stations = StationFinderServices.new.get_stations("80203")
    station = stations[:fuel_stations].first

    expect(station[:station_name]).to eq("UDR")
    expect(station[:access_days_time]).to eq("24 hours daily")
    expect(station[:street_address]).to eq("800 Acoma St")
    expect(station[:distance]).to eq(0.3117)
    expect(station[:fuel_type_code]).to eq("ELEC")
  end
end
