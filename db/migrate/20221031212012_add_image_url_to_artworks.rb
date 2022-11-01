class AddImageUrlToArtworks < ActiveRecord::Migration[6.1]
  def change
    add_column :artworks, :image_url, :string
  end
end
