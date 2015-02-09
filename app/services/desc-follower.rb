#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'twitter'
require 'yaml'

class DescFollower
  #initializeにしない理由がある。スレッドセーフ的な
  def get_twitter_client
    conf = YAML::load_file(File.join("#{__dir__}/../../config", "config.yml"))
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = conf["tw_consumer_key"]
      config.consumer_secret = conf["tw_consumer_secret"]
      config.access_token = conf["tw_access_token"]
      config.access_token_secret = conf["tw_access_token_secret"]
    end
    @client
  end

  def get_followers(twitter_id)
    follower_list = []
    follower_descriptions = []
    users = []
    i=0
    begin
      follower_ids = @client.follower_ids(twitter_id).to_a
      loop_count = (follower_ids.size - 1) / 100 + 1
      loop_count.times do
        ids_temp = follower_ids.pop(100) #末尾100アカウントを毎回取って使用
        accounts_temp = @client.users(ids_temp)
        follower_list << accounts_temp
      end
      follower_list.flatten.each do |user|
#        puts "#{i+=1}: #{user.screen_name}"
        users << user#.description
      end
    rescue Twitter::Error::TooManyRequests => error
      sec = error.rate_limit.reset_in
      puts "wait #{sec} sec"
      sleep(sec) #規制解除までの秒数
      retry
    ensure
      return users
    end
  end

  def get_descriptions(followers)
    follower_descriptions = []
    followers.each do |user|
      follower_descriptions << user.description
    end
    return follower_descriptions
  end
end

#fd = DescFollower.new
#twitter_id = "paranoia_c"
#fd.get_twitter_client
#followers = fd.get_followers(twitter_id)
#puts fd.get_descriptions(followers)
