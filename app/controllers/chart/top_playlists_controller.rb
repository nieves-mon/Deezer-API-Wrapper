class Chart::TopPlaylistsController < ApplicationController
    def index
        @top_playlists = @client.chart("playlists")
    end
end
