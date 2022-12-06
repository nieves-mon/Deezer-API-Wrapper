class ApplicationController < ActionController::Base
    rescue_from DeezerApi::Client::DataNotFound, with: :data_not_found
    rescue_from DeezerApi::Client::QueryInvalid, with: :query_invalid

    before_action :initialize_client

    private
        def initialize_client
            @client = DeezerApi::Client.new
        end

        def data_not_found
            render plain: 'Data Not Found'
        end

        def query_invalid
            render plain: 'Query Invalid'
        end
end
