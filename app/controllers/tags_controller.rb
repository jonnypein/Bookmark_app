class TagsController < ApplicationController
  def new
    @tag = Tag.new
    @recommendation = Recommendation.find(params[:recommendation_id])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(strong_params)
    @recommendation = Recommendation.find(params[:recommendation_id])
    @tag.recommendation_id = @recommendation.id
    if @tag.save
      redirect_to user_path(current_user)
    else
      render "new/tag"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to user_path(current_user)
  end


private



  def strong_params
    params.require(:tag).permit(:name)
  end
end
