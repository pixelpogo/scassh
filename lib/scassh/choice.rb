require "rubygems"
require 'highline/import'

module Scassh

  class Choice

    include Api

    attr_accessor :caching_enabled

    def initialize
      @caching_enabled = true
    end

    def select_cloud
      cloud_list = clouds
      raise "Sorry, no cloud available." if cloud_list.size < 1
      show_list(cloud_list)
      index = ask("\n--> Please select cloud:")
      cloud_list[index.to_i - 1] rescue nil unless index.to_i == 0
    end

    def select_instance(cloud_id)
      instance_list = instances(cloud_id)
      raise "Sorry, no instance available in this cloud." if instance_list.size < 1
      show_list(instance_list)
      index = ask("\n--> Please select instance:")
      instance_list[index.to_i - 1] rescue nil unless index.to_i == 0
    end

    private

    def show_list(list)
      list.sort!{|x,y| x[:name] <=> y[:name] }
      list.each_index do |index|
        item = "[#{index + 1}]."
        puts "#{item.rjust(6)} #{list[index][:name]}"
      end
    end

    def caching_enabled?
      @caching_enabled
    end

  end

end

