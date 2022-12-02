require "ostruct"

class DeezerApi::Client
    BASE_URL = "https://api.deezer.com"

    def top_albums
        response = connection.get("/chart/albums")
        JSON.parse(response.body)["tracks"]["data"]
    end

    def top_tracks
        response = connection.get("/chart/tracks")
        JSON.parse(response.body)
    end

    def top_artists
        response = connection.get("/chart/artists")
        JSON.parse(response.body)
    end

    def top_playlists
        response = connection.get("/chart/playlists")
        JSON.parse(response.body)
    end

    def top_tracks
        response = connection.get("/chart/podcasts")
        JSON.parse(response.body)
    end

    private
        def connection
            @connection ||= Faraday.new(url: BASE_URL)
        end
end
