class QiitaItemsController < ApplicationController
  def index
    response_json = QiitaApiClient.get_items
    # レスポンスを簡略化するため、titleプロパティのみ返すようにしている
    render json: response_json.map {|item| item.slice('title') }
  end
end
