class Chart::TopArtistsController < ApplicationController
    def index
        @top_artists = @client.chart("artists")
    end
end
