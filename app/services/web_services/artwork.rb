module WebServices
  class Artwork

    def results
      if response.is_a?(Net::HTTPSuccess)
        case content_kind
        when :xml then xml_document(response.body)
        when :json then json_document(response.body)
        else
          response.body
        end
      else
        response.to_s
      end
    end

    private

    def response
      @response ||= Net::HTTP.get_response(uri)
    end

    def content_type
      @content_type ||= response.header["content-type"]
    end

    def content_kind
      return :text unless content_type
      return :xml if (content_type =~ %r{application\/xml|text\/xml}im).present?
      return :json if (content_type =~ %r{\Aapplication\/json}i).present?

      :text
    end

    def uri
      @uri ||= URI(url)
    end

    def url
      @url ||= "https://api.artic.edu/api/v1/artworks?page=2&limit=100&search?query[term][is_public_domain]=true"
    end

    def xml_document(content)
      xml = Nokogiri::XML(content)
      xml.encoding = "utf-8"
      xml
    end

    # :reek:UtilityFunction
    def json_document(content)
      JSON.parse(content)
    end
  end
end

