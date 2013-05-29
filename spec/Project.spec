# -*- coding: utf-8; mode: ruby; -*-

describe Yant::Project, "when configure" do
  before do
    @project = Yant::Project.new
  end

  it "should be configure" do
    @project.maybe_configure
  end

  after do
    @project = nil
  end
end
