class Chart::TopPodcastsController < ApplicationController
    def index
        @top_podcasts = @client.chart("podcasts")
    end
end
