class Api::V1::SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]

  # GET /spaces or /spaces.json
  def index
    @spaces = Space.all
  end

  # GET /spaces/1 or /spaces/1.json
  def show
  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces or /spaces.json
  def create
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: "Space was successfully destroyed." }
      format.json { head :method_not_allowed }
    end
    # @event = Event.find(params[:event_id])
    # @space = @event.spaces.build(space_params)
    # respond_to do |format|
    #   if @space.save
    #     format.html { redirect_to space_url(@space), notice: "Space was successfully created." }
    #     format.json { render :show, status: :created, location: @space }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @space.errors, status: :unprocessable_entity }
    #   end
    # end
  end
 
  # PATCH/PUT /spaces/1 or /spaces/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to edit_event_url(@space.grid.event), notice: "Space was successfully updated." }
        # format.json { render :show, status: :ok, location: @space }
        format.json { render json: @space, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1 or /spaces/1.json
  def destroy
    # @space.destroy

    respond_to do |format|
      format.html { redirect_to spaces_url, notice: "Space was successfully destroyed." }
      format.json { head :method_not_allowed }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def space_params
      params.require(:space).permit(:position, :status)
    end
end
