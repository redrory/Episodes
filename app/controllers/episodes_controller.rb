class EpisodesController < ApplicationController
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


  def destroy
    Episode.destroy params[:id]
    redirect_to :back, :notice => "Episode has been deleted"
  end

end
