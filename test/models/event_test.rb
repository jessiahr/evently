require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @organization = Organization.create(name: 'Sample Organization')
    @event = Event.create(organization: @organization)
  end

  test 'is associated with a organization' do
    event = Event.new(organization: nil)
    assert event.valid? == false
  end

  test 'it filters by organization' do
    results = Event.by_organization_id(@organization.id)
      assert_equal results.count, @organization.events.count
      no_results = Event.by_organization_id(90000) #some id that does not exist
      assert_equal no_results.count, 0
  end

  test 'it flilters by hostname' do
      Event.create(organization: @organization, hostname: "google.com")
      assert_equal Event.by_hostname("google.com").count, 1
      assert_equal Event.by_hostname("yahoo.com").count, 0
  end
end
