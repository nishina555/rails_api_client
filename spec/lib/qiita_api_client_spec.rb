require 'rails_helper'

describe 'QiitaApiClient' do
  before do
    WebMock.enable!
    allow(Rails.application.credentials).to receive(:qiita).and_return({token: '123'})
  end

  describe '.get_items' do
    context '成功' do
      let(:response_body) { [{ "title": "test" }].to_json }
      before do
        WebMock.stub_request(:get, "https://qiita.com/api/v2/items").
          with(
            headers: {'Authorization' => "Bearer 123"}
          ).
          to_return(
            body: response_body,
            status: 200,
            headers: { 'Content-Type' =>  'application/json' }
          )
      end
      it 'データが取得できること' do
        response_body = QiitaApiClient.get_items
        expect(response_body).to eq(response_body)
      end
    end
    context '失敗' do
      let(:response_body) { { "message": "error_message", "type": "error_type" }.to_json }
      before do
        WebMock.stub_request(:get, "https://qiita.com/api/v2/items").
          with(
            headers: {'Authorization' => "Bearer 123"}
          ).
          to_return(
            body: response_body,
            status: 400,
            headers: { 'Content-Type' =>  'application/json' }
          )
      end
      it '例外が発生すること' do
        expect{ QiitaApiClient.get_items }.to raise_error(QiitaApiClient::HTTPError, "status=400 body=#{JSON.parse(response_body)}" )
      end
    end
  end
end