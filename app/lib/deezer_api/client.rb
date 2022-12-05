require "ostruct"

class DeezerApi::Client
    BASE_URL = "https://api.deezer.com".freeze

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

    private
        def request(method:, endpoint:)
            response = connection.public_send(method, "#{endpoint}")
            JSON.parse(response.body, object_class: OpenStruct)
        end

        def connection
            @connection ||= Faraday.new(url: BASE_URL)
        end
end
