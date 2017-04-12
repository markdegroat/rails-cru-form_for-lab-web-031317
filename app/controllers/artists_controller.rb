class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    #byebug
    @artist = Artist.find(params[:id])
  end

  def create

    @artist = Artist.new(artist_params(:name))
    #put in the code to associate a artist to a artist and artist
    #byebug
    #@artist.artist = Artist.find_or_create_by(id: artist_params(:artist_id))
    #@artist.artist = Artist.find_or_initialize_by(artist_params(:id))

    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params(:name))
    @artist.save
    redirect_to artist_path(@artist)

  end


  def delete
  end

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

end
