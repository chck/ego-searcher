#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'natto'
require 'pry'


class AnalyzeText
  def initialize
    @exclude_txt_path = File.expand_path(File.dirname(__FILE__)) + '/../public/dic/stopword.txt'
    @exclude_words = get_exclude_words
    @mecab_option = "-u #{File.expand_path(File.dirname(__FILE__))}/../public/dic/custom.dic"
    @m = Natto::MeCab.new(@mecab_option)
  end

  def get_exclude_words
    open(@exclude_txt_path, 'r').readlines.map(&:chomp)
  end

  def keyword(text)
    t_map = {}
    @m.parse(text) do |word|
      if word.feature.match('名詞') && !@exclude_words.include?(word.surface)
        t_map[word.surface] = t_map[word.surface] ? t_map[word.surface] + 1 : 1
      end
    end
    t_map.sort_by { |k, v| v }.reverse

    #    t_map.each do |word, count|
    #      puts "#{word}\t\t#{count}"
    #    end
  end
end

if __FILE__ == $0
  at = AnalyzeText.new
  text = '今日も１日楽しかったです'
  text = open(ARGV[0]).read
  text = open('./shortBocchan').read
  text = open('./texts.txt').read
  at.keyword(text)
end