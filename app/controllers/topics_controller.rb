class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
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
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
  end
end
