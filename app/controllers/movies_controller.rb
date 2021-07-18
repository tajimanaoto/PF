class MoviesController < ApplicationController
 #TMDBを使用するために下記を記載
 #rails cを使用しコンソール上でTmdb::Api.key("6202f5cb38f1e6aafa8bd900346a9106")
 # Tmdb::Api.language("ja")を打ち込んで一度読み込ませる必要がある
  require 'themoviedb-api'

  Tmdb::Api.key(ENV["TMDB_API_KEY"])
  Tmdb::Api.language("ja")

  def search
  end

  def show
  end
end
