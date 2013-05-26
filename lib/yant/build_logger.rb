# -*- coding: utf-8; -*-
require 'yant'
require 'yany/build_listener'


class Yant::BuildLogger < Yant::BuildListener
  # 出力先にアクセスします。
  # @return [nil, IO] ログの出力先。
  attr_accessor :output
  # エラー出力先にアウトプットします。
  # @return [nil, IO] エラー用ログの出力先。
  attr_accessor :error
  # メッセージ出力レベルにアクセスします。
  # @return [Symbol]
  attr_accessor :message_output_level

end
