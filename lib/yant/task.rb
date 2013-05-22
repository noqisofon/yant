# -*- coding: utf-8 -*-
require 'yant'
require 'yant/project_component'
require 'yant/target'


# 全てのタスクのための基底クラスです。
# @abstract
# @auther ned rihine
class Yant::Task < ProjectComponent
  # @return [Target] タスクが持っているビルド対象。
  attr_accessor :owning_target
  # @return [String] タスクの名前。
  attr_accessor :name
  # @return [Symbol] タスクの種類。
  attr_accessor :type
  # @return [RuntimeConfigurable] Yantfile の内容。
  attr_accessor :wrapper

  # 新しくタスクオブジェクトを作成します。
  #
  # @return [Task] 新しいタスクオブジェクト。
  def initialize()
  end

  # タスクを実行します。
  #
  #
  def execute
  end

  # タスクがまだ構成されていない場合、構成します。
  #
  #
  def maybe_configure
  end

  # タスクを再構成します。
  #
  #
  def reconfigure
  end

  # レシーバと別のタスクを結びつけます。
  #
  # @note 別のタスクを代表して動くために新しく作成されたタスクを構成する場合に呼び出します。
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
