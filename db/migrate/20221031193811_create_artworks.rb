class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :artwork_id
      t.string :title
      t.string :has_not_been_viewed_much
      t.string :date_start
      t.string :date_end
      t.string :artist_display
      t.string :place_of_origin
      t.string :dimensions
      t.string :medium_display
      t.string :fiscal_year
      t.string :is_public_domain
      t.string :colorfulness
      t.string :latitude
      t.string :longitude
      t.string :gallery_title
      t.string :is_on_view
      t.string :artwork_type_title
      t.string :department_title
      t.string :artist_title
      t.string :style_title
      t.string :image_id

      t.timestamps
    end
  end
end
