class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all.order("published_at desc")
  end

  def create
    # raise
    @recommendation = Recommendation.new()
    @recommendation.user = current_user
    @movie = Movie.find(params[:movie_id])

    @recommendation.movie = @movie

    if @recommendation.save
      redirect_to user_path(current_user)
    else
      render "movies/index"
    end
  end
  # def recommedations_params
  #   params.require(:recommendation).permit(:)
  # end
end
