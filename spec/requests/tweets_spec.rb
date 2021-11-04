require 'rails_helper'

describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する' do 
      get root_path
      expect(response.body).to include(@tweet.text)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する' do 
      get root_path
      expect(response.body).to include(@tweet.image)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get root_path
      expect(response.body).to include("投稿を検索する")
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get tweet_path(@tweet)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する' do 
      get tweet_path(@tweet)
      expect(response.body).to include(@tweet.text)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する' do 
      get tweet_path(@tweet)
      expect(response.body).to include(@tweet.image)
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do 
      get tweet_path(@tweet)
      expect(response.body).to include('＜コメント一覧＞')
    end
  end

 end

# RSpec.describe "Tweets", type: :request do
  # describe "GET /tweets" do
    # it "works! (now write some real specs)" do
      # get tweets_path
      # expect(response).to have_http_status(200)
    # end
  # end
# end
