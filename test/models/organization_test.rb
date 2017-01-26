require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test 'deletes dependent records' do
    @organization = Organization.create(name: 'Sample Organization')
    @event = Event.create(organization: @organization)
    assert_difference('Event.count', -1) do
      @organization.destroy
    end
  end
end
