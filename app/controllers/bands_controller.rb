class BandsController < ApplicationController

  def index
  end

  def create
    Band.create(band_param)
    redirect_to bands_url
  end

  def new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    band = Band.find(params[:id])
    band.update(band_param)
    redirect_to band_url(band)
  end

  def show
    @band = Band.find(params[:id])
    @plural = @band.name[-1] == "s" ? "' " : "'s "
    render :show
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    redirect_to bands_url
  end

  private

  def band_param
    params.require(:band).permit(:name)
  end

end
