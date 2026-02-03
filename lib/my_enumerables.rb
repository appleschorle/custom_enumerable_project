module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0

    self.each do |elem|
      yield elem, index

      index += 1
    end

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    filtered = []

    self.each do |elem|
      filtered << elem if yield(elem)
    end

    filtered
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.each do |elem|
      return false if not yield(elem)
    end

    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    self.each do |elem|
      return true if yield(elem)
    end

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    self.each do |elem|
      return false if yield(elem)
    end

    true
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

    self.each do |elem|
      yield(elem)
    end

    self
  end
end
