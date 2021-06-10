class MoviesController < ApplicationController
  # TMDBからAPIkeyとgemを指定するためのに下記を記載
  require 'themoviedb-api'
  Tmdb::Api.key("6202f5cb38f1e6aafa8bd900346a9106")
  Tmdb::Api.language("ja")

  def search
  end

  def show
  end
end
