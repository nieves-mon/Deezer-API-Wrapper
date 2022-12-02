class TracksController < ApplicationController
    def show
        @track = @client.track(params[:id])
    end
end
