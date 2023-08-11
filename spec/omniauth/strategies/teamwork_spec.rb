require 'spec_helper'
require 'omniauth-teamwork'

describe OmniAuth::Strategies::Teamwork do
  let(:client_id) { '123' }
  let(:client_secret) { 'asdfgh' }
  let(:raw_info) { JSON.parse(File.read('./spec/fixtures/raw_info.json')) }
  let(:request) { double('Request') }
  let(:access_token) { double('OAuth2::AccessToken') }

  before do
    allow(request).to receive(:params).and_return({})
  end

  subject do
    args = [client_id, client_secret].compact
    OmniAuth::Strategies::Teamwork.new(nil, *args).tap do |strategy|
      allow(strategy).to receive(:request).and_return(request)
    end
  end

  describe '#client' do
    it 'has correct Teamwork site' do
      expect(subject.client.site).to eq('https://www.teamwork.com/')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('https://www.teamwork.com/launchpad/login')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('https://www.teamwork.com/launchpad/v1/token')
    end
  end

  describe '#info' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info)
    end

    context 'when data is present in raw info' do
      it 'returns the name' do
        expect(subject.info[:name]).to eq("#{raw_info['first_name']} #{raw_info['last_name']}")
        expect(subject.info[:first_name]).to eq(raw_info['first_name'])
        expect(subject.info[:last_name]).to eq(raw_info['last_name'])
        expect(subject.info[:nickname]).to eq(raw_info['user_name'])
      end

      it 'returns the avatar url' do
        expect(subject.info[:avatar_url]).to eq(raw_info['avatar_url'])
      end

      it 'returns the image' do
        expect(subject.info[:image]).to eq(raw_info['avatar_url'])
      end

      it 'returns the email' do
        expect(subject.info[:email]).to eq(raw_info['email_address'])
      end

      it 'returns the location' do
        location = "#{raw_info['address']['city']} #{raw_info['address']['state']}".strip
        expect(subject.info[:location]).to eq(location)
      end

      it 'returns the description' do
        expect(subject.info[:description]).to eq(raw_info['profile_text'])
      end

      it 'returns the phone' do
        expect(subject.info[:phone]).to eq(raw_info['phone_number_mobile'])
      end
    end
  end

  describe '#credentials' do
    before do
      allow(access_token).to receive(:token).and_return('xxxxx')
      allow(access_token).to receive(:expires?)
      allow(subject).to receive(:access_token).and_return(access_token)
    end

    it 'returns a Hash' do
      expect(subject.credentials).to be_a(Hash)
    end

    it 'returns the token' do
      expect(subject.credentials[:token]).to eq('xxxxx')
    end
  end
end
