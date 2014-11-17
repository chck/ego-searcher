#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'sinatra/base'
require 'sinatra/reloader'

class EgoSearcher < Sinatra::Base
  get '/' do
    erb :index
  end
end
