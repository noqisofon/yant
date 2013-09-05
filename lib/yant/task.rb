# -*- coding: utf-8 -*-
require 'yant/project_component'
require 'yant/target'


# 全てのタスクのための基底クラスです。
# @abstract
# @author ned rihine
class Yant::Task < Yant::ProjectComponent
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
  # @param [String] name    タスクの名前。
  # @param [Target] target  タスクに持たせたいビルド対象。
  # @param [Symbol] type    タスクの種類。
  #
  # @return [Task] 新しいタスクオブジェクト。
  def initialize(name = "", target = nil, type = :unknown)
    self.name          = name
    self.owning_target = target
    self.type          = type

    @valid = false
  end

  # タスクを実行します。
  #
  # @return [self] self を返します。
  def execute
    maybe_configure if invalid?

    
  end

  # タスクがまだ構成されていない場合、構成します。
  #
  # @return [self] self を返します。
  def maybe_configure
  end

  # タスクを再構成します。
  #
  # @return [self] self を返します。
  def reconfigure
  end

  # レシーバと別のタスクを結びつけます。
  #
  # @param [Task] other_task 結び付けたいタスク。
  #
  # @note 別のタスクを代表して動くために新しく作成されたタスクを構成する場合に呼び出します。
  def bind_to_owner(other_task)
  end

  private
  #
  #
  #
  def invalid?
    not @valid
  end

  #
  #
  #
  def valid?
    @valid
  end
end
