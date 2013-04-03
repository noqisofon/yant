# -*- coding: utf-8; -*-
require 'yant/file_node'


class Yant::Dependency
  #
  #
  #
  def initialize(product, options = {})
    @product = product
    @options = options
    @files = []
  end

  #
  #
  #
  def parent_product
    @product
  end

  #
  #
  #
  def size
    @files.size
  end

  #
  #
  #
  def <<(file_node)
    # file_node が Yant::FileNode クラスのオブジェクトではない場合は
    # Yant::FileNode にして追加します。
    file_node = Yant::FileNode.new file_node unless
      file_node.class == Yant::FileNode
    # TODO: 重複は build.yml を読み込むクラスでする。
    @files.push file_node
  end

  #
  #
  #
  def outdate_files(always_outdate = false)
    # プロダクトが存在しない(ビルドされていない)場合は依存関係の
    # ファイル全てを返します。
    # また、always_outdate が真の場合もファイル全てを返します。
    return @files if not @product.exist? or always_outdate

    product_modify_time = @product.modify_time

    return @files.select { |file_node|
      file_node.modify_time > product_modify_date
    }
  end
end
