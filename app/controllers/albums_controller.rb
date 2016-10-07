class AlbumsController < ApplicationController

  def index
  end

  def create
    album = Album.create!(album_params)
    redirect_to "/bands/#{album.band.id}/albums/#{album.id}"
  end

  def new
    @band = Band.find(params[:band_id])
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)
    redirect_to "/bands/#{album.band.id}/albums/#{album.id}"
  end

  def show
    @album = Album.find(params[:id])
    @plural = @album.name[-1] == "s" ? "' " : "'s "
    render :show
  end

  def destroy
    album = Album.find(params[:id])
    band = album.band
    album.destroy
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_name, :category)
  end

end
