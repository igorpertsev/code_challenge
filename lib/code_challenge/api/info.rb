module CodeChallenge
  module Api
    class Info < Base
      class << self
        def call(api_url, zip)
          JSON.parse(RestClient.get("#{api_url}/info/#{zip}"))
        end
      end
    end
  end
end
