FROM ruby:2.7.1

# 作業ディレクトリを/rails_api_clientに指定
WORKDIR /rails_api_client

# ローカルのGemfileをDokcerにコピー
COPY Gemfile* /rails_api_client/

# /rails_api_clientディレクトリ上でbundle install
RUN bundle install