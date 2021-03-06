class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new
    @topic.title  = params[:topic][:title]
    @topic.user = current_user
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.title  = params[:topic][:title]
    @topic.save
    redirect_to @topic
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    @topic.destroy
  end
end
