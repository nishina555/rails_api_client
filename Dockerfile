FROM ruby:2.7.1

# 作業ディレクトリを/rails6_api_mysql8に指定
WORKDIR /rails6_api_mysql8

# ローカルのGemfileをDokcerにコピー
COPY Gemfile* /rails6_api_mysql8/

# /rails6_api_mysql8ディレクトリ上でbundle install
RUN bundle install