# encoding: utf-8
require 'erb'

module Overviewer
  class Configuration

    def initialize(world, output, params={})
      @world, @output = world, output
      @params = params
    end

    def render
      ERB.new(template).result(binding)
    end

    def template
      File.read(template_path)
    end

    def template_path
      File.expand_path('../../../share/config.py.erb', __FILE__)
    end

  # --

    def dimension
      @params[:dimension] || 'overworld'
    end

    def mode
      @params[:mode] || 'normal'
    end

    def north
      @params[:north] || 'upper-left'
    end

    def format
      @params[:format] || 'png'
    end

    def quality
      @params[:quality] || 100
    end

    def crop
      @params[:crop]
    end

    def texture_path
      @params[:texture_path]
    end

  end
end
