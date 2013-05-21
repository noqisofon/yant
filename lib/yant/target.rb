# -*- coding: utf-8; -*-
require './yant'


class Yant::Target
  attr_accessor :name, :description, :location, :project

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
