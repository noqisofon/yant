# -*- coding: utf-8; -*-


# 簡単なプロジェクト実行者です。
#
class Yant::Executor

  # 指定されたプロジェクトオブジェクトからビルド対象を実行します。
  #
  # @param [Project]             project  プロジェクト。
  # @param [Array<String>]  target_names  実行するビルド対象名の配列。
  #
  # @return [Executor] self を返します。
  def execute_targets(project, target_names)
    @ownering_project = project

    @ownering_project.targets target_names

    self
  end

  # サブプロジェクトのプロジェクト実行者を返します。
  #
  # @return [Executor] サブプロジェクトのプロジェクト実行者。
  def subproject_executor
    return nil if @ownering_project.nil?

    @ownering_project.create_sub_project
  end

end
