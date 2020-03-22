module CodeChallenge
  module Api
    class Import < Base
      class << self
        def call(api_url, zip_to_cbsa_path, cbsa_to_msa_path)
          parameters = {
            files: {
              zip_to_cbsa: File.new(zip_to_cbsa_path),
              cbsa_to_msa: File.new(cbsa_to_msa_path)
            }
          }
          response = RestClient.post("#{api_url}/import", parameters)

          { status: response.code == 200 ? :ok : :error, response: JSON.parse(response.body) }
        end
      end
    end
  end
end
