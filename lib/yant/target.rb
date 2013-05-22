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

  # 新しいターゲットオブジェクトを作成します。
  #
  # @return [Target]
  def initialize
    @dependencies = []
    @tasks        = []
  end

  # レシーバに依存する全てのオブジェクトを返します。
  #
  # @return [Array<String>] レシーバに依存する全てのオブジェクト。
  def dependencies
    @dependencies
  end

  #
  #
  #
  def tasks
    @tasks
  end

  # レシーバに依存するものを追加します。
  #
  # @param [String] dependency 依存するファイルか何かの名前。
  #
  # @return [self] self を返します。
  def add_dependency(dependency)
    @dependencies.push dependency

    self
  end

  # other がレシーバに追加されていれば真を返します。
  #
  # @param (see #add_dependency)
  #
  # @return [true, false]
  def depend_on(other_dependency)
    @dependencies.include? other
  end

  # タスクを追加します。
  #
  # @param [Task] task 追加するタスク。
  #
  # @return [self] self を返します。
  def add_task(task)
    @tasks.push task

    self
  end
end
