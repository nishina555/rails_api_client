
class QiitaApiClient
  class HTTPError < StandardError
    def initialize(response)
      super "status=#{response.status} body=#{response.body}"
    end
  end

  class << self
    def connection
      Faraday::Connection.new('https://qiita.com') do |builder|
        # builder.authorization :Bearer, "123"
        builder.authorization :Bearer, "#{Rails.application.credentials.qiita[:token]}"
        builder.request  :url_encoded # リクエストパラメータを URL エンコードする
        builder.response :logger # レスポンスを標準出力する
        builder.adapter Faraday.default_adapter # アダプターの選択。デフォルトはNet::HTTP
        builder.response :json, :content_type => "application/json" # レスポンスボディをJSONパースする
      end
    end

    def get_items
      response = connection.get(
        '/api/v2/items'
      )
      if response.success?
        response.body
      else
        raise QiitaApiClient::HTTPError.new(response)
      end
    end
  end
end