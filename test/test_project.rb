# -*- coding: utf-8 -*-
require 'minitest/unit'
require 'minitest/autorun'

$LOAD_PATH << File.expand_path( '../lib' )

require 'yant'


class TestYantProject < MiniTest::Unit::TestCase

  def setup
    @project = Yant::Project.with "./build.yml"
  end

  def test_name
    actual = @project.name
    expected = "TestProject"

    assert_equal expected, actual
  end

  def test_description
    actual = @project.description
    expected = "テスト用のプロジェクト"

    assert_equal expected, actual
  end

  def test_targets
    actual = @project.targets
    expected = [ "foo.c" ]

    assert_equal expected.length, actual.length
    assert_equal expected, actual
  end
end
