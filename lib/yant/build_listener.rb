# -*- coding: utf-8; -*-
require 'yant'


#
# {BuildEvent} を受け取るリスナーを表します。
#
class Yant::BuildListener

  # ビルドが終了した際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def build_finished(event)
  end

  # ビルドが始まった際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def build_started(event)
  end

  # メッセージをログ出力する際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def message_logged(event)
  end

  # ターゲットのビルドが終了した際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def target_finished(event)
  end

  # ターゲットのビルドが始まった際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def target_started(event)
  end

  # タスクが終了した際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def task_finished(event)
  end

  # タスクが始まった際に呼び出されます。
  #
  # @param [BuildEvent] event ビルドイベント。
  #
  def task_started(event)
  end

end
