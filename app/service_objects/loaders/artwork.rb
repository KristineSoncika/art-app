module Loaders
  class Artwork

    def records
      @records =
        results["data"].map do |result|
          {
            artwork_id: result["id"],
            title: result["title"],
            has_not_been_viewed_much: result["has_not_been_viewed_much"],
            date_start: result["date_start"],
            date_end: result["date_end"],
            artist_display: result["artist_display"],
            place_of_origin: result["place_of_origin"],
            dimensions: result["dimensions"],
            medium_display: result["medium_display"],
            fiscal_year: result["fiscal_year"],
            is_public_domain: result["is_public_domain"],
            colorfulness: result["colorfulness"],
            latitude: result["latitude"],
            longitude: result["longitude"],
            gallery_title: result["gallery_title"],
            is_on_view: result["is_on_view"],
            artwork_type_title: result["artwork_type_title"],
            department_title: result["department_title"],
            artist_title: result["artist_title"],
            style_title: result["style_title"],
            image_id: result["image_id"],
            image_url: "https://www.artic.edu/iiif/2/#{result["image_id"]}/full/800,/0/default.jpg"
          }
        end
    end

    def load!
      ActiveRecord::Base.transaction do
        delete_records
        save_records
      end

      true
    end

    def load
      ActiveRecord::Base.transaction do
        save_records
      end

      true
    end

    private

    def service
      @service ||= WebServices::Artwork.new
    end

    def results
      service.results
    end

    def delete_records
      ::Artwork.delete_all
    end

    def save_records
      records.each do |record|
        artwork = ::Artwork.find_or_initialize_by(
          artwork_id: record[:artwork_id],
          title: record[:title],
          has_not_been_viewed_much: record[:has_not_been_viewed_much],
          date_start: record[:date_start],
          date_end: record[:date_end],
          artist_display: record[:artist_display],
          place_of_origin: record[:place_of_origin],
          dimensions: record[:dimensions],
          medium_display: record[:medium_display],
          fiscal_year: record[:fiscal_year],
          is_public_domain: record[:is_public_domain],
          colorfulness: record[:colorfulnes],
          latitude: record[:latitude],
          longitude: record[:longitude],
          gallery_title: record[:gallery_title],
          is_on_view: record[:is_on_view],
          artwork_type_title: record[:artwork_type_title],
          department_title: record[:department_title],
          artist_title: record[:artist_title],
          style_title: record[:style_title],
          image_id: record[:image_id],
          image_url: record[:image_url]
        )

        artwork.save!
      end
    end
  end
end