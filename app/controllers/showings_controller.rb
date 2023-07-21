class ShowingsController < ApplicationController
  
  def create
    @movie = Movie.find(params[:movie_id])
    @showing = @movie.showings.create(showing_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @showing = @movie.showings.find(params[:id])
    @showing.destroy
    redirect_to movie_path(@movie), status: :see_other
  end
  
  private
  def showing_params
    params.require(:showing).permit(:date, :time)
  end
  
end
