class ArtistsController < ApplicationController
    def show
        @artist = @client.artist(params[:id])
        @top_tracklist = @client.artist_top_tracklist(params[:id])
        @related_artists = @client.related_artists(params[:id])
    end
end
