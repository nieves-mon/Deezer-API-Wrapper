class PlaylistsController < ApplicationController
    def show
        @playlist = @client.playlist(params[:id])
    end
end
