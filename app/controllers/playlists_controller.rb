class PlaylistsController < ApplicationController
  before_action :load_user, only: [:index, :new, :create]
  before_action :load_playlist, only: [:show, :edit]

  def index
    @playlists = @user.playlists.all
    # binding.pry
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = @user.playlists.create(title: params[:playlist][:title], creator_id: @user.id)
    @playlist.purchases << @user.purchases.where( 
      song_id: params[:playlist][:songs]
    )
    redirect_to playlist_path(@playlist)
  end

  def show
  end

  def edit
    @user = User.find(@playlist.creator_id)
    @users = User.all
    # binding.pry
  end

  def update
    # @playlist.users << User.where( 
    #   id: params[:playlist][:user_id]
  end

  private

  def load_user
    @user = User.find_by(id: params[:user_id])
  end

  def load_playlist
    @playlist = Playlist.find(params[:id])
  end
end