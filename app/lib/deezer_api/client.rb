require "ostruct"

class DeezerApi::Client
    BASE_URL = "https://api.deezer.com"

    def chart(type)
        response = connection.get("/chart")
        data = JSON.parse(response.body)[type]["data"]
        data.map { |el| OpenStruct.new(el) }
    end

    private
        def connection
            @connection ||= Faraday.new(url: BASE_URL)
        end
end
