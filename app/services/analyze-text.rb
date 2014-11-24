#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'natto'

#text = "今日も１日楽しかったです"
#text = open(ARGV[0]).read

class AnalyzeText
  def keyword(text)
    t_map = {}
    @m = Natto::MeCab.new
    @m.parse(text) do |word|
      t_map[word.surface] = t_map[word.surface] ? t_map[word.surface] + 1 : 1
    end
    t_map = t_map.sort_by {|k,v| v}
    #t_map.each do |word, count|
    #  puts "#{word}\t\t#{count}"
    #end
  end
end

#at = AnalyzeText.new
#texts = open("./texts.txt").readlines
#text = open("./texts.txt").read
#at.keyword("dwdew")
