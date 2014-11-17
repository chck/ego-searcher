#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'services/followers'

class EgoSearcher < Sinatra::Base
  get '/' do
    @followers = (1..5)#Followers.all
    erb :index
  end

  post '/analysis' do
    #@followers = Followers.all
    redirect '/'
  end
end
