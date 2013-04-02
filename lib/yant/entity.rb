# -*- coding: utf-8; -*-


class Yant::Entity

  #
  #
  #
  def initialize(path)
    @path = path
  end

  #
  #
  #
  def path
    @path
  end

  #
  #
  #
  def modify_time
    File.mtime path
  end

  #
  #
  #
  def exist?
    File.exist? path
  end
end
