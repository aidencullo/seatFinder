class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy buy_ticket]
  layout "alternate"

  # GET /events or /events.json
  def index
    @events = Event.all
    # p request.env["HTTP_ACCEPT"]
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # # POST /events or /events.json
  # def create
  #   @company = Company.find(params[:company_id])
  #   @event = @company.events.create(event_params)

  #   respond_to do |format|
  #     if @event.save
  #       format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
  #       format.json { render @event, status: :created }
  #       format.xml { render xml: @people }
  #     else
  #       format.html { redirect_to @company, alert: "Event could not
  # be created" }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end

  # end

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
      format.json { render json: @event, status: :ok }
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
