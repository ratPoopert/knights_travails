# frozen_string_literal: true

class Path
  attr_reader :source, :destination

  def initialize(source, destination)
    @source = source
    @destination = destination
  end

  def self.completed?(current_path, completed_paths)
    completed_paths.any? do |completed_path|
      completed_path.destination == current_path.destination
    end
  end
end