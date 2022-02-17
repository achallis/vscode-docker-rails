require 'rails_helper'

describe PagesController do
  context '#index' do
    before { get :index }
    it 'returns a HTTP 200 OK' do
      expect(response.code).to eq '200'
    end
    it 'returns Hello World' do
      expect(response.body).to eq 'Hello World'
    end
  end
end
