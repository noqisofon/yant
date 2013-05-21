require './yant'


class Yant::ProjectComponent
  attr_accessor :description, :location, :project

  #
  #
  #
  def initialize(a_description = "", a_location ="", a_project = nil)
    self.description = a_description
    self.location = a_location
    self.project = a_project
  end
end
