class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :albums
end
