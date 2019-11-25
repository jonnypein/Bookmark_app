class RecommendationsController < ApplicationController
  def create
    @recommendation = Recommnedation.new
  end

  # def recommedations_params
  #   params.require(:recommendation).permit(:)
  # end
end
