class ApplicationController < ActionController::Base
    before_action :initialize_client

    private
        def initialize_client
            @client = DeezerApi::Client.new
        end
end
