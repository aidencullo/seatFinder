class EventsController < ApplicationController
  around_action :handle_exceptions, if: proc { request.path.include?('/api') }
  before_action :set_event, only: %i[ show edit update destroy buy_ticket]

  # Catch exception and return JSON-formatted error
  def handle_exceptions
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      @status = 404
      @message = 'Record not found'
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity_response(e.record) && return
    rescue ArgumentError => e
      @status = 400
    rescue StandardError => e
      @status = 500
    end
    render json: { success: false, message: @message || e.class.to_s,
                  errors: [{ detail: e.message }] }, status: @status unless e.class == NilClass
  end
  # GET /events or /events.json
  def index
    @events = Event.all
  end
  
  # GET /events/1 or /events/1.json
  def show
    @company = @event.company
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
