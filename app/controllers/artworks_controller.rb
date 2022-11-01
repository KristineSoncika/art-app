class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.select_type.page params[:page]
    @q = Artwork.ransack(params[:q])
    @works = @q.result(distinct: true)
  end
end
