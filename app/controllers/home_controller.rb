class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @subscription = Subscription.new
    begin
      @tweets = Twitter.user_timeline('bbcfood').first(1).collect { |tweet| tweet.text }
    rescue
      @tweets = ['Twitter not available']
    end
  end
end