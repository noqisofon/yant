# -*- coding: utf-8; -*-


# 依存関係の中の生成元ファイルと生成後ファイルのペアを表します。
#
#
class Yant::Dependency

  # 生成元ファイル名を表します。
  # @return [String] 生成元。
  attr_accessor :source
  # 生成元ファイルがあるパスを表します。
  # @return [String] 生成元ファイルがあるパス。
  attr_accessor :source_dir
  # 生成ファイル名を表します。
  # @return [String] 生成物。
  attr_accessor :destination
  # 生成後ファイルがあるパスを表します。
  # @return [String] 生成後ファイルがあるパス。
  attr_accessor :destination_dir

  @@default_options = {
    :source => '',
    :source_dir => '.',
    :destination => nil,
    :destination_dir => '.'
  }

  # 生成元ファイルパスと生成後ファイルパスを渡して依存関係オブジェクトを作成します。
  #
  # @return (see #initialize)
  def self.create(source, destination)
    self.new( :source => File.basename( source ),
             :source_dir => File.dirname( source ),
             :destination => File.basename( destination ),
             :destination_dir => File.dirname( destination ) )
  end

  # 生成元、生成後ファイル名を渡して新しい依存関係オブジェクトを作成します。
  #
  # @note ,*_dir がない場合、デフォルトはカレントディレクトリになります。
  #
  # @param [Hash] opts
  # @option opts [String, DependencySet] :source                 生成元ファイル名。DependencySet でも大丈夫そう。
  # @option opts [String]                :source_dir ('.')       生成元ファイルがあるパス。
  # @option opts [nil, String]           :destination (nil)      生成後ファイル名。
  # @option opts [String]                :destination_dir ('.')  生成後ファイルがあるパス。
  #
  # @return [Dependency] 新しい依存関係オブジェクト。
  def initialize(opts = {})
    @options = @@default_options.merge opts

    self.source           = opts[:source]
    self.source_dir       = opts[:source_dir]
    self.destination      = opts[:destination]
    self.destination_dir  = opts[:destination_dir]
  end

  # 生成元ファイルパスを返します。
  #
  # @return [String] 生成元ファイルの絶対パス。
  def source_path
    File.combine self.source_dir, self.source
  end

  # 生成後ファイルパスを返します。
  #
  # @return [String] 生成後ファイルの絶対パス。
  def destination_path
    return File.combine self.destination_dir, self.destination if has_destination?

    self.destination_dir
  end

  # レシーバが生成後ファイル名を持っていれば真を返します。
  #
  #
  def has_destination?
    return false if self.destination.nil?

    true
  end

  # アクティブなら真を返します。
  #
  # @note source が destination より新しければアクティブであるとみなされます。
  #
  # @return [Boolean] アクティブなら真。
  def active?
    src_path = self.source_path
    dest_path = self.destination_path

    # dest_path がディレクトリだったり、存在しなかったら真を返します。
    return true if File.directory?( dest_path ) or
      not File.exists?( dest_path )

    return File.mtime( src_path ) > File.mtime( dest_path )
  end
end
