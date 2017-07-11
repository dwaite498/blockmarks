class LikesController < ApplicationController
  def index
  end
  
  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
 
     if like.save
       flash[:success] = "Bookmark liked!"
     else
       flash[:alert] = "Unable to like bookmark, please try again."
       
       redirect_to [@bookmark.topic, @bookmark]
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:id])
     @like = current_user.likes.find(params[:id])
 
     if like.destroy
       flash[:success] = "Bookmark liked!"
     else
       flash[:alert] = "Error, like not deleted!"
       
       redirect_to [@bookmark.topic, @bookmark]
     end
   end
end
