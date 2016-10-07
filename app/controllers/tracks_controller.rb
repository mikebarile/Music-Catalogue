class TracksController < ApplicationController

  def index
  end

  def create
    track = Track.create!(track_params)
    redirect_to "/bands/#{track.album.band.id}/albums/#{track.album.id}/tracks/#{track.id}"
  end

  def new
    @album = Album.find(params[:album_id])
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    render :edit
  end

  def update
    track = Track.find(params[:id])
    track.update(track_params)
    redirect_to "/bands/#{track.album.band.id}/albums/#{track.album.id}/tracks/#{track.id}"
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    track = Track.find(params[:id])
    album = track.album
    track.destroy
    redirect_to "/bands/#{track.album.band.id}/albums/#{track.album.id}"
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_name, :category, :lyrics)
  end

end
