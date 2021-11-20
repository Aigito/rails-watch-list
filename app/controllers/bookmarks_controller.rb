class BookmarksController < ApplicationController
  before_action :find_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def find_list
    @list = list.find(params[:list_id])
  end

  def find_movie
    @movie = movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
