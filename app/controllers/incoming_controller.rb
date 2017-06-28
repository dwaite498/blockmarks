class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

   def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by_email(params[:sender])
    @topic = Topic.find_by_title(params[:subject])
    @url = params["stripped-text"]
    
    # You put the message-splitting and business
    # magic here.
    if @user.nil?
      @user.create(:email => :sender)
     # Check if user is nil, if so, create and save a new user
    end
     

     # Check if the topic is nil, if so, create and save a new topic
     if @topic.nil?
      title = params[:subject]
      @topic.create(:title => title, user_id: @user.id)
     end

     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     @bookmark = Bookmark.create(:url => @url, :topic => @topic)
    
    # Assuming all went well.
    head 200
  end
end