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
        respond_to do |format|
        format.html { redirect_to user_path(current_user)}
        format.js  # <-- will render `app/views/tags/create.js.erb`
      end
    else
        respond_to do |format|
        format.html { render 'new/tag' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
     respond_to do |format|
        format.html { redirect_to user_path(current_user)}
        format.js  # <-- will render `app/views/tags/create.js.erb`
      end
    end
  end



private



  def strong_params
    params.require(:tag).permit(:name)
  end
end
