# frozen_string_literal: true

class Path
  def self.completed?(current_path, completed_paths)
    completed_paths.any? do |completed_path|
      completed_path[:to] == current_path[:to]
    end
  end
end