require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
    @event = events(:one)
    @event.organization_id = @organization.id
  end

  test 'should get organization events index' do
    get :index, organization_id: @organization.name
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test 'should get new' do
    get :new, organization_id: @organization.name
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post :create, organization_id: @organization.name, event: { hostname: @event.hostname, message: @event.message, organization_id: @event.organization_id, timestamp: @event.timestamp }
    end

    assert_redirected_to organization_event_path(assigns(:organization), assigns(:event))
  end

  test 'should show event' do
    get :show, id: @event, organization_id: @organization.name
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @event, organization_id: @organization.name
    assert_response :success
  end

  test 'should update event' do
    patch :update, organization_id: @organization.name, id: @event, event: {
      hostname: @event.hostname,
      message: @event.message,
      organization_id: @event.organization_id,
      timestamp: @event.timestamp
    }
    assert_redirected_to organization_event_path(
      assigns(:organization), assigns(:event)
    )
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event, organization_id: @organization.name
    end

    assert_redirected_to organization_events_path(assigns(:organization))
  end
end
