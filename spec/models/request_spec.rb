require 'spec_helper'

describe "InviteMe::Request" do

  let!(:object){ FactoryGirl.build(:request) }


  describe "#downcase_email" do
    before do
      object.email = 'DownCAsed.eMAil@domAin.coM'
    end
    it "downcases email" do
      object.downcase_email
      expect( object.email ).to eq('downcased.email@domain.com')
    end
  end

  describe "#invite" do
    before{ object.invite }
    it "should invite the requester" do
      expect( object.invited? ).to be_true
    end
  end
end
