class TweetController < ApplicationController
  require './lib/twitter_api.rb'
  def index
  end
  def search
    # include twitter_api
    # puts 'search ran'
    if !params[:search].blank?
      @tweets = TwitterApi.get_last_25_tweets(params[:search], params[:replies], params[:rts])
    end
    # puts @tweets.first.to_s
    render :index
  end
end
