# -*- coding: utf-8; -*-
require 'yant'
require 'yant/project.rb'
require 'yant/target.rb'
require 'yant/task.rb'


class Yant::BuildEvent

  # @return [Error] エラー情報。
  attr_accessor :error

  # プロジェクト、ターゲット、タスクオブジェクトを渡してビルドイベントオブジェクトを作成します。
  #
  # @overload initialize(project)
  #  @param [Project] project
  # @overload initialize(target)
  #  @param [Target] target
  # @overload initialize(task)
  #  @param [Task] task
  #
  # @return [BuildEvent] 新しいビルドイベントオブジェクト。
  def initialize(*args)
    @source = args.shift
    @error = ""
    @message = ""
    @priority = :info
  end

  #
  #
  #
  def message
    @message
  end

  # 優先度と一緒にメッセージを設定します。
  #
  #
  def set_message(message, priority)
    @message = message
    @priority = priority
  end

  # ビルドイベントの優先度を返します。
  #
  #
  def priority
    @priority
  end

end
