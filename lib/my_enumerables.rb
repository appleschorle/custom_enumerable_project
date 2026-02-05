module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0

    self.my_each do |elem|
      yield elem, index

      index += 1
    end

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    filtered = []

    self.my_each do |elem|
      filtered << elem if yield(elem)
    end

    filtered
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.my_each do |elem|
      return false if not yield(elem)
    end

    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    self.my_each do |elem|
      return true if yield(elem)
    end

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    self.my_each do |elem|
      return false if yield(elem)
    end

    true
  end

  def my_count
    count = 0

    self.my_each do |elem|
      count += 1 if not block_given? or yield elem
    end

    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    mapped = []

    self.my_each do |elem|
      mapped << yield(elem)
    end

    mapped
  end

  def my_inject(prev)
    result = nil

    self.my_each do |elem|
      result = yield prev, elem
      prev = result
    end

    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in 0...self.size
      yield(self[i])
    end

    self
  end
end
