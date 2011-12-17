class EpisodesController < ApplicationController
  def index
  	@episodes = Episode.all
  end

  def create
  	Episode.create params[:episode]
  	redirect_to :back
  end

end
