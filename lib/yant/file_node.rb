# -*- coding: utf-8; -*-


class Yant::FileNode

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
    # path メソッドは、そんなに時間がかからないことを前提にしている。
  end

  #
  #
  #
  def create_time
    File.ctime path
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
  def access_time
    File.atime path
  end

  #
  #
  #
  def exist?
    File.exist? path
  end
end
