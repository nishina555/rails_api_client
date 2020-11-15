# require 'spec_helper'
require 'rails_helper'

describe 'Credentials' do
  it 'stubs credentials' do
    # ref: https://github.com/rspec/rspec-rails/issues/2099
    # allow(Rails.application.credentials).to receive(:olimart).and_return('123')
    # expect(Rails.application.credentials.olimart).to eq('123')

    allow(Rails.application.credentials).to receive(:qiita).and_return({token: '123'})
    expect(Rails.application.credentials.qiita[:token]).to eq('123')
  end
end