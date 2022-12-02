class AlbumsController < ApplicationController
    def show
        @album = @client.album(params[:id])
    end
end
