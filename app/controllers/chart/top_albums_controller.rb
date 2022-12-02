class Chart::TopAlbumsController < ApplicationController
    def index
        @top_albums = @client.chart("albums")
    end
end
