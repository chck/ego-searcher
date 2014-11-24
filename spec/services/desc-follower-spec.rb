#!/usr/bin/env ruby
#-*- coding:utf-8 -*-
require 'spec_helper'

describe DescFollower do
  before do
    DescFollower.new.get_twitter_client
  end

  it "get_followers return array" do
    expect(DescFollower.new.get_followers).to be_instance_of Array
  end
end
