class EventsController < ApplicationController
  before_action :set_organization
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index

    @events = Event
    @events = filtered_by_organization(@events)
    @events = filtered_by_result_count(@events)
    @events = filtered_by_hostname(@events)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.organization_id = @organization.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to organization_event_path(@organization, @event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: organization_event_path(@organization, @event) }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to organization_event_path(@organization, @event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to organization_events_url(@organization), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def filtered_by_organization(events)
    if @organization
      events.by_organization_id(@organization.id)
    else
      events
    end
  end

  def filtered_by_result_count(events)
    if safe_params.keys.include? "count"
      events.limit(safe_params["count"])
    else
      events.all
    end
  end

  def filtered_by_hostname(events)
    if safe_params.keys.include? "hostname"
      events.by_hostname(safe_params["hostname"])
    else
      events
    end
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def safe_params
    params.permit(:organization_id, :count, :hostname)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:message, :hostname, :timestamp)
  end
end
