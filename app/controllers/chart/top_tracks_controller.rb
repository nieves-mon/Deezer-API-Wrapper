class Chart::TopTracksController < ApplicationController
    def index
        @top_tracks = @client.chart("tracks")
    end
end
