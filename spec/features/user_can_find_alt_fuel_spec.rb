require "rails_helper"

describe "User can find alt fuel within 6 miles" do
  scenario "user can find 10 closest elec and propane stations within 6 miles" do

    visit '/'

    fill_in 'q', with: "80203"

    click_on "Locate"

    expect(current_path).to eq("/search")

    expect(page).to have_content("Name")
    expect(page).to have_content("Types of Fuel")
    expect(page).to have_content("Address")
    expect(page).to have_content("Distance")
    expect(page).to have_content("When You Can Access Them")
  end
end
