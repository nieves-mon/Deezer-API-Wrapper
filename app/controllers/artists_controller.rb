class ArtistsController < ApplicationController
    def show
        @artist = @client.artist(params[:id])
        @top_tracklist = @client.artist_top_tracklist(params[:id])
    end
end
