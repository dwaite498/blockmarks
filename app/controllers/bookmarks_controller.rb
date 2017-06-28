class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)
    # @bookmark.user = current_user
    @bookmark.save
    redirect_to topic_path(@topic)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.save
    redirect_to :topic
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic_id
    @bookmark.destroy
    redirect_to topic_path(@topic)
  end
  
  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
