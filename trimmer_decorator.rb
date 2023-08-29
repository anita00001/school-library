require_relative 'base_decorator'

class Trimmer < Decorator
  def correct_name
    super.strip[0...10]
  end
end
