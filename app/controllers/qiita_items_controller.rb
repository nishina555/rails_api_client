class QiitaItemsController < ApplicationController
  # GET /qiita_items
  def index
    @qiita_items = []

    render json: @qiita_items
  end
end