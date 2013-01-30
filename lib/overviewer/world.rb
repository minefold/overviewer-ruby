require 'overviewer/configuration'
require 'tempfile'
require 'shellwords'

module Overviewer
  class World

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def render(output_path, options={})
      config = Configuration.new(@path, output_path, options)

      c = Tempfile.new(['overviewer', '.py'])
      c.puts(config.render)
      c.close

      pid = spawn("overviewer.py --config=#{Shellwords.escape(c.path)}",
        :err => :out,
        :out => '/dev/null'
      )
      Process.wait(pid)
    ensure
      c.unlink
    end

  end
end
