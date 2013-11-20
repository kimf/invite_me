require 'spec_helper'

describe "administration" do
  let!(:request) { FactoryGirl.create(:request) }

  it "fails to auth unless giving credentials" do
    visit '/requests'
    expect(page).to have_content "HTTP Basic: Access denied."
  end

  context "when logged in" do
    before(:each) do
      page.driver.browser.authorize(ENV['ADMIN_USER'], ENV['ADMIN_PASS'])
      visit '/requests'
    end

    it "shows the requests" do
      expect(page).to have_content request.email
      expect(page).to have_content request.referring_url
      expect(page).to have_content request.landing_url
    end

    it "is possible to invite a requester" do
      click_button "INVITE"
      page.should_not have_content "INVITE"
      page.should have_content "Requester invited"

      expect(InviteMe::Request.last.invited?).to be_true
      expect(InviteMe::Request.last.invited_at).to be_within(1.minute).of(Time.now)
    end
  end
end
