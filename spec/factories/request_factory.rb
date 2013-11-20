FactoryGirl.define do
  factory :request, class: InviteMe::Request do
    email 'one.validemail@techcrunch.com'

    referring_url 'http://facebook.com'
    landing_url   'http://example.com'
  end
end
