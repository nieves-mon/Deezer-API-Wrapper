class Chart::TopAlbumsController < ApplicationController
    def index
        @top_albums = @client.top_albums
    end
end
