class Album < ActiveRecord::Base
  validates :name, :band_id, :category, presence: true
  validates :name, uniqueness: true

  attr_reader :band_name

  def band_name=(band_name)
    band = Band.find_by(name: band_name)
    self.band_id = band.id
  end

  belongs_to :band
  has_many :tracks
end
