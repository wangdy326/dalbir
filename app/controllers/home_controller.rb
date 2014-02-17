class HomeController < ApplicationController
  before_filter :authenticate_broker!
  def index
    movie = Struct.new(:id, :name)
    @movies = [movie.new(1, 'name1'), movie.new(2, 'name2')]
  end

  def new
  end

  def characters_in_movie
#    https://github.com/christianreyes/updating-drop-down/blob/master/app/controllers/home_controller.rb
#    @characters = Character.all.where(:movie_id => params[:movie_id])
    character = Struct.new(:id, :name)
    @characters = [character.new(1, 'character 1'), character.new(2, 'character 2')]

    render :partial => 'characters', :locals => {:characters => @characters}
  end
end
