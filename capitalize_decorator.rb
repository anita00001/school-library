require_relative 'base_decorator'

class Capitalize < Decorator
  def correct_name
    super.capitalize
  end
end
