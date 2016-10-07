class NotesController < ApplicationController

  before_action :check_id, only: [:destroy]

  def check_id
    track = Track.find(params[:track_id])
    note = Note.find(params[:id])
    if current_user.id != note.user_id
      redirect_to "/bands/#{track.album.band.id}/albums/#{track.album.id}/tracks/#{track.id}"
    end
  end

  def create
    track = Track.find(params[:track_id])
    Note.create(track_id: params[:track_id], user_id: current_user.id,
      note: params[:note])
    redirect_to "/bands/#{track.album.band.id}/albums/#{track.album.id}/tracks/#{track.id}"
  end

  def destroy
    track = Track.find(params[:track_id])
    note = Note.find(params[:id])
    note.destroy
    redirect_to "/bands/#{track.album.band.id}/albums/#{track.album.id}/tracks/#{track.id}"
  end

end
