class TweetController < ApplicationController
  def index
  end
  def search
    # puts 'search ran'
    if !params[:search].blank?
      @tweets = TwitterApi.get_last_25_tweets(params[:search], params[:replies], params[:rts])
    end
    # puts @tweets.first.to_s
    render :index
  end
end
