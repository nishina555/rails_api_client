class QiitaApiClient
  class << self
    def get_items
      # require 'net/http'
      uri = URI.parse('https://qiita.com')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Get.new(
        '/api/v2/items',
        'Authorization' => "Bearer #{Rails.application.credentials.qiita[:token]}"
      )
      http.request(req)
      res = http.request(req)
      @qiita_items = res.body
      JSON.parse(@qiita_items)
    end
  end
end