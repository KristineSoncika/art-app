class Artwork < ApplicationRecord
  # validates :title, :artist_title, :image_url

  paginates_per 9

  scope :select_type, -> {Artwork.where(artwork_type_title: 'Painting')
                                 .or(Artwork.where(artwork_type_title: 'Print'))
                                 .or(Artwork.where(artwork_type_title: 'Drawing and Watercolor'))}

end

