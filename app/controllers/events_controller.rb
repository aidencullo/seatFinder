class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy test]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @company = @event.company
  end

  # POST /events/1 or /events/1.json
  def test
    @ticket = @event.tickets.create(customer_id: 1, seat: params[:seat])
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { redirect_to @event.company, alert: "Ticket could not
  be created" } 
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end

  end

  
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @company = Company.find(params[:company_id])
    @event = @company.events.create(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { redirect_to @company, alert: "Event could not
  be created" } 
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @company = @event.company
    @event.destroy

    respond_to do |format|
      format.html { redirect_to @company, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:venue_id,
                                  :company_id, :grid_attributes => [:rows, :cols]
                                 )
  end  
end
