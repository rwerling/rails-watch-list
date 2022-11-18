class BookmarksController < ApplicationController
  # before_action :set_list, only: [:new, :create]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end