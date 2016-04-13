class Counter
  def initialize
    @count = 0
  end

  def inc
    @count += 1
    nil # because we want to expose the value only with the value method
  end

  def value
    @count
  end
end
