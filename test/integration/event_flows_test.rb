require 'test_helper'

class EventFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @organization1 = Organization.create(name: 'Sample Organization1')
    10.times do
      Event.create(organization: @organization1, hostname: 'server1.co')
    end

    @organization2 = Organization.create(name: 'Sample Organization2')
    10.times do
      Event.create(organization: @organization2, hostname: 'server2.co')
    end
  end

  test "lists all events for all organizations" do
    get events_path
    assert_response :success
    assert assigns(:events).map(&:organization_id).uniq.count > 1
  end

  test "filters by count" do
    get organization_events_path(@organization1), count: 1
    assert_response :success
    assert_equal assigns(:events).count, 1
  end

  test "filters by hostname and limits results" do
    @organization = Organization.create(name: 'Sample Organization')
    10.times do
      Event.create(organization: @organization, hostname: 'server1.co')
    end
    get events_path, hostname: 'server1.co', count: 1
    assert_response :success
    assert_equal assigns(:events).count, 1
  end


  test "orders results by timestamp desc" do
    event = Event.create(organization: @organization2, timestamp: Time.now, hostname: 'server2.co')
    Event.create(organization: @organization2, timestamp: 1.day.ago, hostname:'server2.co') #created last
    get events_path, count: 1
    assert_response :success
    assert_equal assigns(:events).first.id, event.id
  end

  test "filters by hostname and limits results within an Organization" do
    get organization_events_path(@organization1), hostname: 'server1.co', count: 4
    assert_response :success
    assert_equal assigns(:events).count, 4
  end



end
