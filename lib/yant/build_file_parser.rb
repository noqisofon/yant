# -*- coding: utf-8; -*-
require 'yaml'

require 'yant'
require 'yant/errors'


#
#
#
class Yant::BuildFileParser
  #
  #
  #
  def initialize(options = {})
    @options = options
  end

  #
  #
  #
  def parse(filepath)
    verify filepath

    raw_conf = File.open( filepath, "r" ) { |output| YAML.load output }
  end

  private
  #
  #
  #
  def verify(filepath)
    # filepath が存在しない場合。
    raise Yant::FileNotFoundError, "#{filepath}: No such file or directory" if
      File.exists? filepath
    # filepath がディレクトリだった場合。
    raise ArgumentError, "#{filepath}: Is a directory" if
      File.directory? filepath
  end
end
