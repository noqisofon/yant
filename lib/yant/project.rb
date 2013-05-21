# -*- coding: utf-8; -*-
require './yant'
require './yant/build_task'
require './yant/executor'
require './yant/filter_set'
require './yant/task'


class Yant::Project
  attr_accessor :name, :description, :parent_project, :base_dir, :default, :executor

  #
  #
  #
  def initialize(name = "", description = "", parent_project = nil, base_dir = File.expand_path '.', default = nil, executor = nil)
    self.name             = name
    self.description      = description
    self.parent_project   = parent_project
    self.base_dir         = base_dir
    self.default          = default
    self.executor         = executor

    @targets              = {}
    @build_listeners      = []
    @filters              = FilterSet.new

    @sub_projects         = {}
    @properties           = {}
  end

  #
  #
  #
  def targets
    @targets.values.dup
  end

  #
  #
  #
  def build_listeners
    @build_listeners.dup
  end

  #
  #
  #
  def global_filter_set
    @filters.dup
  end

  #
  #
  #
  def property(name)
    return "" unless @properties.has_key? name

    @properties[name]
  end

  #
  #
  #
  def set_property(name, value)
    @properties[name] = value
  end

  #
  #
  #
  def add_target(name, target)
    @targets[name] = target
  end
  #
  #
  #
  def add_target(target)
    @targets[target.name] = target
  end

  #
  #
  #
  def add_build_listener(listener)
    @build_listeners.push listener unless
      @build_listeners.include? listener
  end

  #
  #
  #
  def remove_build_listener(listener)
    @build_listeners.remove listener if
      @build_listeners.include? listener
  end

  #
  #
  #
  def add_filter(token, value)
    token = token.to_sym unless token.class == Symbol

    @filters[token] = value
  end

  #
  #
  #
  def create_sub_project
    Project.new( "", self )
  end

  #
  #
  #
  def create_task(task_type)
    task_type = task_type.to_sym

    case task_type
      when :build
      return BuildTask.new( self )
    end
  end

  #
  #
  #
  def execute_sorted_targets(targets)
    targets.each do |target|
      target.execute
    end
  end

  #
  #
  #
  def execute_target(target_name)
    @targets[target_name].execute if @targets.has_key? target_name
  end

  #
  #
  #
  def execute_targets(names)
    (@targets.keys & names).each do |name|
      @targets[name].execute
    end
  end
end
