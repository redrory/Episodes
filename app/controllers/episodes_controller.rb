class EpisodesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:login, :watch]

  def index
    @episode = Episode.new
  	@episodes = Episode.all
  end

  def create
  	Episode.create params[:episode]
  	redirect_to :back
  end

  def edit
  	@episode = Episode.find params[:id]
  end

  def update
    episode = Episode.find params[:id]
    if episode.update_attributes params[:episode]
      redirect_to episodes_path, :notice => "Success"
    else
      redirect_to :back, :notice => "There was an error updating episode"
    end
  end

  def watch
    episode = Episode.find params[:id]
    @watch = episode.number + 1

    if episode.update_attributes(:number => @watch)
      redirect_to episodes_path, :notice => "You saw that episode"
    else
      redirect_to :back, :notice => "There was an error updating episode"
    end

    ## increase episode.number + 1
    #Object.update_attributes(:field1 => "value", :field2 => "value2", :field3 => "value3")

    #redirect_to :back, :notice => "You saw that episode"
  end

  def login
    if user_signed_in?
      redirect_to episodes_path
  else

  end

  end


  def destroy
    Episode.destroy params[:id]
    redirect_to :back, :notice => "Episode has been deleted"
  end

end
