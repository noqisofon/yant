require './yant'
require './yant/project_component'



class Yant::Task < ProjectComponent
  attr_accessor :owning_target, :name, :type, :wrapper

  #
  #
  #
  def initialize()
  end

  #
  #
  #
  def execute
  end

  #
  #
  #
  def maybe_configure
  end

  #
  #
  #
  def reconfigure
  end

  #
  #
  #
  def bind_to_owner(other_task)
  end

  private
  #
  #
  #
  def invalid?
  end

  #
  #
  #
  def valid?
  end
end
