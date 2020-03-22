require 'code_challenge/api/base'
require 'code_challenge/api/import'
require 'code_challenge/api/info'

module CodeChallenge
  class Client
    DEFAULT_API_URL = 'https://codechallengepeerstreet.herokuapp.com/v1/'.freeze
    DEFAULT_TEST_URL = 'localhost:300'.freeze

    attr_reader :api_url

    def initialize(url = nil)
      @api_url = url || default_url
    end

    def import(zip_to_cbsa_path, cbsa_to_msa_path)
      ::CodeChallenge::Api::Import.call(api_url, zip_to_cbsa_path, cbsa_to_msa_path)
    end

    def info(zip)
      ::CodeChallenge::Api::Info.call(api_url, zip)
    end

    private

    def default_url
      ENV['RAILS_ENV'] == 'test' ? DEFAULT_TEST_URL : DEFAULT_API_URL
    end
  end
end
