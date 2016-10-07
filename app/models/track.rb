class Track < ActiveRecord::Base
  validates :name, :album_id, :category, :lyrics, presence: true
  validates :name, uniqueness: true

  def album_name=(album_name)
    album = Album.find_by(name: album_name)
    self.album_id = album.id
  end

  belongs_to :album
  has_many :notes
end
