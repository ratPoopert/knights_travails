# frozen_string_literal: true

class Path
  attr_reader :source, :destination

  def initialize(source, destination)
    @source = source
    @destination = destination
  end

  def completed?(completed_paths)
    completed_paths.any? do |completed_path|
      completed_path.destination == @destination
    end
  end

  def to_s
    "#{@source} -> #{@destination}"
  end
end