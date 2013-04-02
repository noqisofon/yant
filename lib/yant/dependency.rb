# -*- coding: utf-8; -*-
require 'yant/entity'


class Yant::Dependency
  #
  #
  #
  def initialize(product, options = {})
    @product = product
    @options = options
    @entities = []
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
    @entities.size
  end

  #
  #
  #
  def <<(entity)
    # entity が Yant::Entity クラスのオブジェクトではない場合は
    # Yant::Entity にして追加します。
    entity = Yant::Entity.new entity unless
      entity.class == Yant::Entity
    @entities.push entity
  end

  #
  #
  #
  def outdate_entities(always_outdate = false)
    # プロダクトが存在しない(ビルドされていない)場合は依存関係の
    # エンティティ全てを返します。
    # また、always_outdate が真の場合もエンティティ全てを返します。
    return @entities if not @product.exist? or always_outdate

    product_modify_time = @product.modify_time

    return @entities.select { |entity|
      entity.modify_time > product_modify_date
    }
  end
end
