# -*- coding: utf-8; -*-
require 'yant'
require 'yant/project'


#
#
#
class Yant::Application

  @@default_options = {
    :output_dir => '.',
    :tmp_dir    => '.',
    
  }

  #
  #
  #
  def initialize(opts = {})
    @options = opts.merge @@default_options
    @projects = []
  end

  #
  #
  #
  def start
    @projects.each do |project|
      project.execute_tasks
    end
  end

  #
  #
  #
  def self.main(args)
    progn = Application.new

    # カレントディレクトリにある、
    #   - build.ya?ml
    #   - *.project
    # を検索します。
    project_files = Dir.glob( [ "build.ya?ml", "*.project" ] )

    exit 1 if project_files.size == 0

    project = Project.get_project project_files.pop

    progn.add_project project
    progn.start
  end

  private
  # プロジェクトを追加します。
  #
  #
  def add_project(project)
    @projects.push project
  end

end
