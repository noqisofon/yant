# -*- coding: utf-8; -*-
require 'yant'
require 'yant/dependency'


#
#
#
class Yant::DependencySet

  @@default_options = {
    :input_dir   => '.',
    :output_dir  => '.',
    :source_kind => :clang_source
  }

  #
  #
  #
  def initialize(opts = {})
    @options      = @@default_options.merge opts
    @dependencies = []
  end

  # 依存ファイルを追加します。
  #
  # @overload add(source)
  #   @param [String] source ソースファイルの名前。
  # @overload add(source, dest)
  #   @param [String] source ソースファイルの名前。
  #   @param [String] dest   出力ファイルの名前。
  #
  #
  def add(source, dest = nil)
    dest = "#{File.basename( source, '.*' )}.o" if dest.nil?
    @dependencies << Dependency.create( source, dest )

    self
  end

  # 一つでもアクティブになっている依存ファイルがあれば真を返します。
  #
  #
  def any_active?
    @dependencies.any? { |dependency| dependency.active? }
  end

  # 全ての依存要素がアクティブであれば真を返します。
  #
  #
  def all_active?
    @dependencies.all? { |dependency| dependency.active? }
  end

  # アクティブな
  #
  #
  def actives
    @dependencies.select { |dependency| dependency.active? }
  end

  #
  #
  #
  def to_a
    @dependencies
  end
end
