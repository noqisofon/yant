# -*- coding: utf-8; -*-


module Yant
  #
  # Yant の全てのエラーのベース。
  #
  class Error < ::RuntimeError; end

  #
  # コマンドラインオプションに関する何らかのエラー。
  #
  class CommandLineError < Yant::Error; end

  #
  # 何らかのファイルが存在しなかったエラー。
  #
  class FileNotFoundError < Yant::Error
    # ファイルのパス。
    attr_reader :file_path

    def initialize(filepath)
      @file_path = filepath
    end
  end

  #
  # ビルド対象の依存関係に関する何らかのエラー。
  #
  class DependencyError < Yant::Error; end

  #
  # ファイルパーミッションの不一致に関係する何らかのエラー。
  #
  class FilePermissionError < Yant::Error
    attr_reader :directory

    def initialize(directory)
      @directory = directory

      super "You don't have write permissions for the #{directory} directory"
    end
  end
end
