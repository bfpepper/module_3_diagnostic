require "rails_helper"

describe "User can find alt fuel within 6 miles" do
  scenario "user can find 10 closest elec and propane stations within 6 miles" do

    # When I visit "/"
    visit '/'

    # And I fill in the search form with 80203
    fill_in 'q', with: "80203"

    # And I click "Locate"
    click_on "Locate"

    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq("/search")

    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to have_content("Name")
    expect(page).to have_content("Fuel Types")
    expect(page).to have_content("Address")
    expect(page).to have_content("Distance")
    expect(page).to have_content("Access times")
  end
end
