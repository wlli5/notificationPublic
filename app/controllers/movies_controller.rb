class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    @movies = Movie.all
    rate = params[:ratings]
    sorted = params[:sort]
    if rate.present?
      @selected_ratings =  rate.keys
      @movies = Movie.where(rating: rate.keys)
    else
      @selected_ratings = @all_ratings
      @movies = Movie.all
    end
 if sorted == "Release_Date"
    @css_Release_Date = "hilite"
      @movies = @movies.order(:release_date)
    elsif sorted == "Movie_Title"
    @css_Movie_Title = "hilite"
      @movies = @movies.order(:title)
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
