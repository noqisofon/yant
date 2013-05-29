# -*- coding: utf-8; -*-


# 1 つの依存関係を表します。
#
#
class Yant::Dependency

  # 生成元ファイル名を表します。
  # @return [String] 生成元。
  attr_accessor :source
  # 生成ファイル名を表します。
  # @return [String] 生成物。
  attr_accessor :destination

  # 生成元、生成後ファイル名を渡して新しい依存関係オブジェクトを作成します。
  #
  # @param [Hash] opts
  # @option opts [String, DependencySet] :source            生成元ファイル名。DependencySet でも大丈夫そう。
  # @option opts [nil, String]           :destination (nil) 生成後ファイル名。
  #
  # @return [Dependency] 新しい依存関係オブジェクト。
  def initialize(opts = {})
    self.source = source
    self.destination = destination
  end

  # アクティブなら真を返します。
  #
  # @note source が destination より新しければアクティブであるとみなされます。
  #
  # @return [true,false] アクティブなら真。
  def active?
  end

end
