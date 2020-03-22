RSpec.describe CodeChallenge::Api::Import do
  describe '#call' do
    let(:zip) { "#{Dir.pwd}/spec/fixtures/files/zip_to_cbsa.csv" }
    let(:cbsa) { "#{Dir.pwd}/spec/fixtures/files/cbsa_to_msa.csv" }
    let(:url) { CodeChallenge::Client::DEFAULT_TEST_URL }

    it 'raises exception if zip missing' do
      expect { described_class.call(url, 'some/random/path', cbsa) }.to raise_error(Errno::ENOENT)
    end

    it 'raises exception if cbsa missing' do
      expect { described_class.call(url, zip, 'some/random/path') }.to raise_error(Errno::ENOENT)
    end

    it 'raises exception url not accessible' do
      expect { described_class.call('test_url', zip, cbsa) }.to raise_error(SocketError)
    end

    context 'api call' do
      let(:file) { double }
      let(:response) { double(code: code, body: body) }

      before do
        allow(File).to receive(:new).and_return(file)
        allow(RestClient).to receive(:post).and_return(response)
      end

      context 'successful api call' do
        let(:code) { 200 }
        let(:body) { { }.to_json }

        it 'make post request to correct url' do
          expect(RestClient).to receive(:post).with("#{url}/import", { files: { zip_to_cbsa: file, cbsa_to_msa: file }})
          described_class.call(url, zip, cbsa)
        end

        it 'returns successful response' do
          expect(described_class.call(url, zip, cbsa)).to eq({ status: :ok, response: {} })
        end
      end

      context 'not successful api call' do
        let(:code) { 400 }
        let(:body) { { errors: [] }.to_json }

        it 'returns error response' do
          expect(described_class.call(url, zip, cbsa)).to eq({ status: :error, response: { 'errors' => [] } })
        end
      end
    end
  end
end
