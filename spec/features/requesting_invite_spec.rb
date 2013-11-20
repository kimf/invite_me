require 'spec_helper'

describe "requesting invite process" do

  it "saves the referring url and landing url" do
    visit '/'
    fill_in 'request_email', :with => 'user@domain.com'
    click_button 'Invite Me'
    expect(page).to have_content "You're request was received"

    r = InviteMe::Request.last
    expect(r.referring_url).to eq("http://www.example.com/")
    expect(r.landing_url).to eq("http://www.example.com/")
  end

  it "doesnt save on empty email" do
    visit '/'
    click_button 'Invite Me'

    expect(page).to have_content "Oops, looks like something went wrong!"
    expect(page).to have_content "Email can't be blank and is invalid"
  end

  it "doesnt save on invalid email" do
    visit '/'
    fill_in 'request_email', :with => 'user@example'
    click_button 'Invite Me'

    expect(page).to have_content "Oops, looks like something went wrong!"
    expect(page).to have_content "Email is invalid"
  end
end
