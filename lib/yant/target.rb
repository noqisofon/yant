# -*- coding: utf-8; -*-
require 'yant/project'
require 'yant/location'
require 'yant/dependency_set'


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
  # @return [Project] プロジェクト。
  attr_accessor :project

  # 新しいターゲットオブジェクトを作成します。
  #
  # @return [Target]
  def initialize
    @dependencies = DependencySet.new
    @tasks        = []
  end

  # レシーバに依存する全てのオブジェクトを返します。
  #
  # @return [Array<String>] レシーバに依存する全てのオブジェクト。
  def dependencies
    @dependencies.to_a
  end

  # ビルド対象に含まれている全てのタスクを返します。
  #
  # @return [Array<Task>] ビルド対象に含まれている全てのタスク。
  def tasks
    @tasks
  end

  # レシーバに依存するものを追加します。
  #
  # @param [String] dependency 依存するファイルか何かの名前。
  #
  # @return [self] self を返します。
  def add_dependency(dependency)
    @dependencies.add dependency

    self
  end

  # タスクを追加します。
  #
  # @param [Task] task 追加するタスク。
  #
  # @return [self] self を返します。
  def add_task(task)
    task.target = target
    @tasks << task

    self
  end

  # other_dependency がレシーバに追加されていれば真を返します。
  #
  # @param (see #add_dependency)
  #
  # @return [true, false] レシーバに追加されていれば真。
  def depend_on(other_dependency)
    @dependencies.include? other
  end

  #
  #
  # @return [self] self を返します。
  def perform
    @tasks.each do |task|
      task.execute
    end

    self
  end
end
