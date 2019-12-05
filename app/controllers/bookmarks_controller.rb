class BookmarksController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
    @page = params[:page]
    @bookmark.movie = @movie
    @bookmark.user = current_user
    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user)}
        format.js
      end
    else
      render "movies#index"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      respond_to do |format|
        format.html { redirect_to user_path(current_user)}
        format.js
      end
    end
  end

  def index
    @bookmarks = Bookmark.all
    @bookmarks = current_user.bookmarks
  end
end
