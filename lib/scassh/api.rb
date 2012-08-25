require 'rubygems'
require 'rest-client'
require 'json'
require 'yaml'
require 'tmpdir'
require 'etc'
require 'fileutils'

module Scassh

  module Api

    API_URL = 'https://manage.scalarium.com/api/clouds'

    def clouds
      api.map{|c| {:name => c['name'], :id => c['id']}}
    end

    def instances(cloud_id)
      api("/#{cloud_id}/instances").select{|instance| instance['status'] == 'online'}.map{|instance| {:name => instance['nickname'], :dns_name => instance['dns_name']}}
    end

    def reset_cache(verbose=false)
      Scassh::Api.reset_cache(verbose)
    end

    def self.reset_cache(verbose=false)
      File.unlink(cache_file) rescue ""
    end

    private

    def api(uri = '')
      scalarium_url = "#{API_URL}#{uri}"
      result = from_cache(scalarium_url)
      unless result
        result = JSON.parse(RestClient.get(scalarium_url, headers))
        cache_request(scalarium_url, result) if caching_enabled?
      end
      result
    end

    def headers
      {'X-Scalarium-Token' => token(), 'Accept' => 'application/vnd.scalarium-v1+json'}
    end

    def token
     key = (ENV["SCALARIUM_API_TOKEN"] || IO.read("#{Etc.getpwuid.dir}/.scalarium-api-token") ) rescue nil
     raise "Error! Can't find Scalarium API Key. It is expected to reside in ~/.scalarium-api-token or ENV['SCALARIUM_API_TOKEN']" if key.nil?
     key
    end

    def cache_request(url, result)
      cache = get_cache
      cache = {} if cache.nil?
      cache[url] = result
      write_cache(cache)
    end

    def write_cache(cache)
      FileUtils.touch(cache_file)
      FileUtils.chmod(0600, cache_file, :verbose => @verbose)
      File.open(cache_file, 'w') {|f| f.write(cache.to_yaml)}
    end

    def from_cache(url)
      get_cache[url] rescue nil
    end

    def get_cache
      YAML.load_file(cache_file) if File.exist?(cache_file)
    end

    def cache_file
      Scassh::Api.cache_file
    end

    def self.cache_file
      Etc.getpwuid.dir. + "/.scalarium_api_cache"
    end
    
    def caching_enabled?
      true
    end

  end
end