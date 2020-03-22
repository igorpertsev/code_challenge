RSpec.describe CodeChallenge::Client do
  subject { described_class.new(test_url) }
  let(:test_url) { 'test_url' }

  describe '#import' do
    let(:zip) { "#{Dir.pwd}/spec/fixtures/files/zip_to_cbsa.csv" }
    let(:cbsa) { "#{Dir.pwd}/spec/fixtures/files/cbsa_to_msa.csv" }

    it 'calls CodeChallenge::Api::Import class to import data' do
      expect(CodeChallenge::Api::Import).to receive(:call).with(test_url, zip, cbsa)

      subject.import(zip, cbsa)
    end
  end

  describe '#info' do
    let(:zip) { 501 }

    it 'calls CodeChallenge::Api::Info class to fetch data' do
      expect(CodeChallenge::Api::Info).to receive(:call).with(test_url, zip)

      subject.info(zip)
    end
  end
end
