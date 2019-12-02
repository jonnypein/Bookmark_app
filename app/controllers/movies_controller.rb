class MoviesController < ApplicationController
  # def bookmarked
  #   @movies = Movie.where
  # end

  def index
    if params[:query].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search_movies
    # if params[:input].present?
      @search_movies = Movie.where("title ILIKE ?", "%#{params[:input]}%")
    # else
    #   @search_products = policy_scope(Product).where(published: true)
    # end
    @query = params[:input]
    respond_to do |format|
      format.js
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :genre, :year)
  end
end
