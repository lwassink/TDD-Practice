class Array
  def remove_dups
    self.inject([]) do |acc, el|
      acc << el unless acc.include?(el)
      acc
    end
  end

  def two_sum
    sum_array = []

    (0..length - 2).each do |start|
      (start + 1...length).each do |finish|
        sum_array << [start, finish] if self[start] + self[finish] == 0
      end
    end

    sum_array
  end

  def my_transpose
    unless first.is_a?(Array)
      return map { |el| [el] }
    end
    transpose = Array.new(self.first.length) { [] }

    each do |row|
      row.each_with_index do |el, i|
        transpose[i] << el
      end
    end

    transpose
  end

  def stock_picker
    best_value = nil
    best_pair = []

    (0..length - 2).each do |idx1|
      (idx1 + 1...length).each do |idx2|
        value = self[idx2] - self[idx1]

        if best_value.nil? || value > best_value
          best_value = value
          best_pair = [idx1, idx2]
        end
      end
    end

    best_pair
  end
end
