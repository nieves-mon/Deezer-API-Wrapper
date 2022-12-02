class ArtistsController < ApplicationController
    def show
        @artist = @client.artist(params[:id])
    end
end
