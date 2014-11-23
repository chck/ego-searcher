#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require './analyze-text'
require './desc-follower'

class AnalyzeFollower
  def initialize
    @fd = DescFollower.new
    @fd.get_twitter_client
    @at = AnalyzeText.new
  end

  def get_fw_kw(twitter_id)
    puts "-----GET FOLLOWER INFO-----"
    followers = @fd.get_followers(twitter_id)
    texts = @fd.get_descriptions(followers).join
    puts "-----ANALYZE KEYWORD-----"
    @at.keyword(texts)
    puts "-----END-----"
  end

  def all

  end
end

twitter_id = ARGV[0]
af = AnalyzeFollower.new
af.get_fw_kw(twitter_id)
