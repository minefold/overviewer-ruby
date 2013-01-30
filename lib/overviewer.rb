require 'overviewer/configuration'
require 'overviewer/world'
require 'overviewer/version'

module Overviewer
  def self.render(world, output, options={})
    World.new(world).render(output, options)
  end
end
