# -*- coding: utf-8; -*-
require 'yant'
require 'yant/build_task'
require 'yant/executor'
require 'yant/filter_set'
require 'yant/task'


#
# パッケージをビルドするために必要な情報が格納された Yant プロジェクトを表します。
# @see Task, Executor, BuildFilter, Property
# @author ned rihine
#
class Yant::Project
  #
  # @return [String] プロジェクト名。
  attr_accessor :name
  #
  # @return [String] プロジェクトの説明。
  attr_accessor :description
  #
  # @return [nil, Project] 親プロジェクト。
  attr_accessor :parent_project
  #
  # @return [String] ベースディレクトリ。
  attr_accessor :base_dir
  #
  # @return [nil, Task] デフォルトタスク。
  attr_accessor :default
  #
  # @return [Executor] エグゼキューター。
  attr_accessor :executor

  # プロジェクトの名前、概要、親プロジェクト、ベースディレクトリなどなどを指定してプロジェクトオブジェクトを作成します。
  #
  # @param [String]                   name プロジェクトの名前。
  # @param [String]            description プロジェクトの説明。
  # @param [nil, Project]   parent_project このプロジェクトの親。
  # @param [String]               base_dir プロジェクトのベースディレクトリ。
  # @param [nil, Task]             default デフォルトで実行するタスク、またはタスクの名前。
  # @param [nil, Executor]        executor このプロジェクトを実行するためのエグゼキューター。
  #
  # @return [Project] 新しいプロジェクトオブジェクト。
  def initialize(name = "", description = "", parent_project = nil, base_dir = File.expand_path( '.' ), default = nil, executor = nil)
    self.name             = name
    self.description      = description
    self.parent_project   = parent_project
    self.base_dir         = base_dir
    self.default          = default
    self.executor         = executor

    @targets              = {}
    @build_listeners      = []
    @filters              = FilterSet.new

    @sub_projects         = {}
    @properties           = {}
  end

  # プロジェクトに格納された全てのターゲットを返します。
  #
  # @return [Array<String>] プロジェクトに格納された全てのターゲットを含む配列。
  def targets
    @targets.values.dup
  end

  # レシーバに格納された全てのビルドリスナーを返します。
  #
  # @return [Array<BuildListener>] レシーバに格納された全てのビルドリスナーの配列。
  def build_listeners
    @build_listeners.dup
  end

  # レシーバに格納されたフィルタセットを返します。
  #
  # @return [FilterSet] レシーバに格納されたフィルタセット。
  def global_filter_set
    @filters.dup
  end

  # プロパティ名に対応する値を返します。
  # @param name [String] プロパティの名前。
  #
  # @return [String, nil]
  def property(name)
    return "" unless @properties.has_key? name

    @properties[name]
  end

  # プロパティを設定します。
  # @param name [String] 設定するプロパティ名。
  # @param value [String] 設定する値。
  #
  # @return [self] self を返します。
  def set_property(name, value)
    @properties[name] = value

    self
  end

  # ターゲットを追加します。
  #
  # @overload add_target(target)
  #   @param [Target] target 追加したいターゲット。
  # @overload add_target(name, target)
  #   @param [String] name ターゲットの名前。
  #   @param [Target] target 追加したいターゲット。
  #
  # @return [self] self を返します。
  def add_target(target)
    @targets[target.name] = target

    self
  end
  def add_target(name, target)
    @targets[name] = target

    self
  end

  # ビルドリスナーを追加します。
  #
  # @note 引数の listener は、BuildListener のメソッドが定義さえされていればどんなオブジェクトでも追加できます。
  #
  # @param [Object, BuildListener] listener 追加したいビルドリスナー。
  #
  # @return [self] self を返します。
  def add_build_listener(listener)
    @build_listeners.push listener unless
      @build_listeners.include? listener

    self
  end

  # 指定されたビルドリスナーを削除します。
  #
  # @param [BuildListener] listener 削除したいビルドリスナー。
  #
  # @return [BuildListener] 削除されたビルドリスナーを返します。
  def remove_build_listener(listener)
    @build_listeners.remove listener if
      @build_listeners.include? listener

    listener
  end

  # フィルターを追加します。
  # @param [String] token フィルタトークン？
  # @param          value フィルタ値。
  #
  # @return [self] self を返します。
  def add_filter(token, value)
    token = token.to_sym unless token.class == Symbol

    @filters[token] = value
    self
  end

  # レシーバを親とする新しいプロジェクトを作成します。
  #
  # @return [Project]
  def create_sub_project
    Project.new( "", self )
  end

  # レシーバに所属しているタスクを作成して返します。
  # @param [String, Symbol] task_type 作成するタスクの種類。
  #
  # @return [Task] 作成されたタスク。
  def create_task(task_type)
    task_type = task_type.to_sym

    case task_type
      when :build
      return BuildTask.new( self )

      when :copy
      return CopyTask.new( self )

      when :move
      return MoveTask.new( self )
    end
  end

  #
  #
  #
  def execute_sorted_targets(targets)
    targets.each do |target|
      target.execute
    end
  end

  # タスクを実行します。
  # @param [String] target_name 実行したいタスクの名前。
  #
  def execute_target(target_name)
    @targets[target_name].execute if @targets.has_key? target_name
  end

  # タスクの名前の配列を受け取ってその名前のタスクを実行します。
  # @param [Array<String>] names 実行したいタスクの名前の配列。
  # @see #execute_target
  def execute_targets(names)
    (@targets.keys & names).each do |name|
      execute_target name
    end
  end
end
