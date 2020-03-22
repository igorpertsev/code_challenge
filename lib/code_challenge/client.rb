require 'code_challenge/api/base'
require 'code_challenge/api/import'
require 'code_challenge/api/info'

module CodeChallenge
  class Client
    DEFAULT_API_URL = 'https://codechallengepeerstreet.herokuapp.com/v1/'.freeze

    attr_reader :api_url

    def initialize(url = DEFAULT_API_URL)
      @api_url = url
    end

    def import(zip_to_cbsa_path, cbsa_to_msa_path)
      ::CodeChallenge::Api::Import.call(api_url, zip_to_cbsa_path, cbsa_to_msa_path)
    end

    def info(zip)
      ::CodeChallenge::Api::Info.call(api_url, zip)
    end
  end
end
