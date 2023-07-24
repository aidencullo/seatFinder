class ShowingsController < ApplicationController

  # GET /showings/new
  def new
    @showing = Showing.new
  end
  
  # POST /showings or /showings.json
  def create
    @showing = Showing.new(showing_params)
    puts "params #{showing_params}"
    
    respond_to do |format|
      if @showing.save
        format.html { redirect_to @showing.movie, notice: "Showing was successfully created." }
        format.json { render :show, status: :created, location: @showing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @showing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @showing = @movie.showings.find(params[:id])
    @showing.destroy
    redirect_to movie_path(@movie), status: :see_other
  end
  
  private
  def showing_params
    params.require(:showing).permit(:movie_id, :date)
  end
  
end
