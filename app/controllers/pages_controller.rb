class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @movies = policy_scope(Movie).search_by_title_and_location(params[:query])
    else
      @movies = policy_scope(Movie)
    end
  end
end
