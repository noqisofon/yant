# -*- coding: utf-8; -*-
require 'yant/file_node'
require 'yant/dependency'


class Yant::Product < Yant::FileNode
  @@default_options = {
    :output_dir => "./bin",
    :output_type => :unknown
  }

  #
  #
  #
  def initialize(name, options = {})
    @name = File.basename name
    @options = options.merge @@default_options
    @dependency = Yant.Dependency.new self
  end

  #
  # プロダクトの名前を返します。
  #
  def name
    @name
  end

  #
  #
  #
  def name=(name)
    @name = name
    # プロダクト名が更新されたので、@output_path を nil にする。
    @output_path = nil
  end

  #
  # プロダクトの出力ディレクトリパスを返します。
  #
  def output_dir
    @options[:output_path]
  end

  #
  # プロダクトの出力ディレクトリパスを設定します。
  #
  def output_dir=(path)
    @options[:output_path] = path
    # プロダクトの出力ディレクトリが更新されたので、@output_path を nil にする。
    @output_path = nil
  end

  #
  # プロダクトの出力タイプを返します。
  #
  def output_type
    @options[:output_type]
  end

  #
  # プロダクトの出力タイプを設定します。
  #
  def output_type=(type)
    @options[:output_type] = type
  end

  #
  # 依存するエンティティを追加します。
  #
  def add_dependency(dependency)
    @dependencies << dependency
  end

  #
  # プロダクトの出力パスを返します。
  #
  def path
    # そうすると、どちらかの要素が更新された場合、
    # @output_path は nil であり、path メソッドを呼び出すと @output_path が
    # 更新される。
    # どちらかの要素が更新されるまで、@output_path には値が入っているので、
    # @output_path を返すだけになる。
    @output_path ||= File.join @options[:output_dir], @name
    # path メソッドはそこかしこで呼ばれる感があるので、キャッシングして少しでも
    # 速くしようという試み。
  end

  #
  #
  #
  def modify_date
    File.mtime path
  end
end
