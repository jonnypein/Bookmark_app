class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @movies = Movie.search_by_title_and_location(params[:query]).first(4)
    else
      @movies = Movie.first(5)
    end
  end
end
