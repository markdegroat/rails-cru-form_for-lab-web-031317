class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def show
    #byebug
    @genre = Genre.find(params[:id])
  end

  def create

    @genre = Genre.new(genre_params(:name))
    #put in the code to associate a genre to a artist and genre
    #byebug
    #@genre.artist = Artist.find_or_create_by(id: genre_params(:artist_id))
    #@genre.genre = Genre.find_or_initialize_by(genre_params(:id))

    @genre.save
    redirect_to genre_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.update(genre_params(:name))
    @genre.save
    redirect_to genre_path(@genre)

  end


  def delete
  end

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
