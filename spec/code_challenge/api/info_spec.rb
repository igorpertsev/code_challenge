RSpec.describe CodeChallenge::Api::Info do
  describe '#call' do
    let(:url) { CodeChallenge::Client::DEFAULT_TEST_URL }
    let(:zip) { 501 }

    context 'api call' do
      let(:response) { double(code: code, body: body.to_json) }

      before do
        allow(RestClient).to receive(:get).and_return(response)
      end

      context 'successful api call' do
        let(:code) { 200 }
        let(:body) do
          {
            "cbsa"=>35620,
            "name"=>"New York-Newark-Jersey City,
            NY-NJ-PA",
            "lsad"=>"Metropolitan Statistical Area",
            "pop_2010"=>19601147,
            "pop_2011"=>19756397,
            "pop_2012"=>19871785,
            "pop_2013"=>19994144,
            "pop_2014"=>20095119,
            "pop_2015"=>20182305,
            "zip"=>"501"
          }
        end

        it 'make post request to correct url' do
          expect(RestClient).to receive(:get).with("#{url}/info/#{zip}")
          described_class.call(url, zip)
        end

        it 'returns successful response' do
          expect(described_class.call(url, zip)).to eq(body)
        end
      end
    end
  end
end
