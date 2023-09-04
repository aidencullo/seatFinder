class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  # before_action :set_event, only: %i[ new ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new    
    @space = Space.find(params[:space_id])
    @customer = Customer.create
    @ticket = @space.build_ticket
    @ticket.seat = params[:seat]
    @ticket.customer = @customer
  end

  # GET /tickets/1/edit
  def edit
  end

  def buy
    @space = Space.find(params[:space_id])
    @customer = Customer.create
    @ticket = @space.build_ticket
    @ticket.seat = params[:seat]
    @ticket.customer = @customer

    respond_to do |format|
      format.html { render :new, notice: "Ticket was successfully created." }
      format.json { render :show, status: :created, location: @ticket }
    end
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.create(ticket_params)
    
    respond_to do |format|
      if @ticket.save!
        @ticket.space.update(available: false)
        format.html { redirect_to @ticket.space.event, notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # def set_event
  #   @event = Event.find(params[:event_id])
  # end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:customer_id, :name,
  :seat, :space_id)
  end
end

