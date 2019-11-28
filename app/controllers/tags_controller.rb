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


  def index
     if params[:query].present?
      @tags = Tag.all.search_by_tag_name(params[:query])
    else
      @Tag = Tag.all
    end
  end

  private

  def strong_params
    params.require(:tag).permit(:name)
  end

end
