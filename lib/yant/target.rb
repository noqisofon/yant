# -*- coding: utf-8; -*-
require 'yant'
require 'yant/project'
retuire 'yant/location'


# ビルド対象を表します。
#
#
class Yant::Target
  # @return [String] ターゲット名。
  attr_accessor :name
  # @return [String] ターゲットの説明。
  attr_accessor :description
  # @return [Location]
  attr_accessor :location
  attr_accessor :project

  def initialize
    @dependencies = []
    @tasks        = []
  end

  #
  #
  #
  def dependencies
    @dependencies
  end

  #
  #
  #
  def tasks
    @tasks
  end

  #
  #
  #
  def add_dependency(dependency)
    @dependencies.push dependency

    nil
  end

  #
  #
  #
  def depend_on(other)
    @dependencies.include? other
  end

  #
  #
  #
  def add_task(task)
    @tasks.push task

    nil
  end
end
