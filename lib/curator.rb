require './lib/photograph'
require './lib/artist'
require 'pry'

class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << Photograph.new(photo)
  end

  def add_artist(artist)
    @artists << Artist.new(artist)
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id}
  end

  def find_photograph_by_id(id)
    @photographs.find {|photo| photo.id == id}
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all {|photo| photo.artist_id == artist.id}
  end

  def artists_with_multiple_photographs
    hash = @photographs.group_by {|photo| photo.artist_id}
    artists_ids = hash.select {|artist, photos| photos.count > 1 }.keys
    @artists.find_all {|artist| artists_ids.include?(artist.id)}
  end

  def photographs_taken_by_artists_from(country)

  end

end
