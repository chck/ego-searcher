#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/config_file"
require_relative 'services/analyze-follower'

class EgoSearcher < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/analysis' do
    puts "start!"
    af = AnalyzeFollower.new
    @keywords = af.get_fw_kw(params[:id])
    puts "done!"
    erb :index
  end
end
