require "ostruct"

class DeezerApi::Client
    class DeezerApiError < StandardError; end
    class DataNotFound < DeezerApiError; end

    BASE_URL = "https://api.deezer.com".freeze

    ERROR_CODES = {
        800 => DataNotFound
    }.freeze

    def chart(type)
        request(
            method: "get",
            endpoint: "/chart/0/#{type}"
        ).data
    end

    def album(id)
        request(
            method: "get",
            endpoint: "/album/#{id}"
        )
    end

    def track(id)
        request(
            method: "get",
            endpoint: "/track/#{id}"
        )
    end

    def artist(id)
        request(
            method: "get",
            endpoint: "/artist/#{id}"
        )
    end

    def playlist(id)
        request(
            method: "get",
            endpoint: "/playlist/#{id}"
        )
    end

    def artist_top_tracklist(artist_id, limit = 50)
        request(
            method: "get",
            endpoint: "/artist/#{artist_id}/top",
            params: {limit: limit}
        )
    end

    private
        def request(method:, endpoint:, params: {})
            response = connection.public_send(method, "#{endpoint}", params)
            data = JSON.parse(response.body, object_class: OpenStruct)
            return data if data.error.nil?
            raise ERROR_CODES[data.error.code]
        end

        def connection
            @connection ||= Faraday.new(url: BASE_URL)
        end
end
