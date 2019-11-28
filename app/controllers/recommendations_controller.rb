class RecommendationsController < ApplicationController
  def index
    @recommendations = current_user.all_follows.map do |follower|
      follower.followable.recommendations
    end
      # recommendation.all.order("created_at desc")
    @recommendations = @recommendations.flatten
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

    def destroy
      @recommendation = Recommendation.find(params[:id])
      @recommendation.destroy
      redirect_to user_path(current_user)
    end

  # def recommedations_params
  #   params.require(:recommendation).permit(:)
  # end
end
