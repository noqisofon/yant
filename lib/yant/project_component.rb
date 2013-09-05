# -*- coding: utf-8; -*-
require 'yant/version'


class Yant::ProjectComponent
  # @return [String] このプロジェクト構成物の説明。
  attr_accessor :description
  # @return [Location] ろけーしょん。
  attr_accessor :location
  # @return [Project] 所属しているプロジェクト。
  attr_accessor :project

  #
  #
  #
  def initialize(description = "", location ="", project = nil)
    self.description = description
    self.location = location
    self.project = project
  end
end
