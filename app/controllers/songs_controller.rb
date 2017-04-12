class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    #byebug
    @song = Song.find(params[:id])
  end

  def create

    @song = Song.new(song_params(:name, :artist_id, :genre_id))
    #put in the code to associate a song to a artist and genre
    #byebug
    #@song.artist = Artist.find_or_create_by(id: song_params(:artist_id))
    #@song.genre = Genre.find_or_initialize_by(genre_params(:id))

    @song.save
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params(:name, :bio, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)

  end


  def delete
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
