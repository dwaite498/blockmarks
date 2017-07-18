class LikesController < ApplicationController
  def index
  end
  
   def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
 
     if like.save
       flash[:success] = "Bookmark liked!"
       
       redirect_to [@bookmark.topic, @bookmark]
     else
       flash[:alert] = "Unable to like bookmark, please try again."
       
       redirect_to [@bookmark.topic, @bookmark]
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:id])
     @like = current_user.likes.find(params[:id])
     @like.destroy
     if @like.destroy
       flash[:success] = "Bookmark liked!"
       
       redirect_to [@bookmark.topic]
     else
       flash[:alert] = "Error, like not deleted!"
       
       redirect_to [@bookmark.topic]
     end
   end
end
