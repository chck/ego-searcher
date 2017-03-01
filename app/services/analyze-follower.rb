#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
#require './analyze-text'
require_relative 'analyze-text'
require_relative 'desc-follower'
#require './desc-follower'

class AnalyzeFollower
  def initialize
    @fd = DescFollower.new
    @fd.get_twitter_client
    @at = AnalyzeText.new
  end

  def get_fw_kw(twitter_id)
    #puts "-----GET FOLLOWER INFO-----"
    followers = @fd.get_followers(twitter_id)
    texts = @fd.get_descriptions(followers).join
    #puts "-----ANALYZE KEYWORD-----"
    return @at.keyword(texts)
    #puts "-----END-----"
  end
end

# twitter_id = ARGV[0]
# af = AnalyzeFollower.new
# af.get_fw_kw(twitter_id).each do |k,v|
#   puts "#{k}\t\t\t#{v}"
# end
