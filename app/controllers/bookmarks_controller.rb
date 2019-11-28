class BookmarksController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
    @bookmark.movie = @movie
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render "movies#index"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  def index
    @bookmarks = current_user.bookmarks
  end
end
