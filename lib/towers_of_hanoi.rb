class Hanoi
  attr_reader :stacks
  def initialize
    @stacks = [[3, 2, 1], [], []]
  end

  def play
    play_turn until won?

    render
    puts "You win!"
  end

  def play_turn
    render

    begin
      move(*get_move)
    rescue ArgumentError
      puts "invalid input, please try again"
      retry
    end
  end

  def move(first, last)
    source = @stacks[first].last
    target = @stacks[last].last
    raise ArgumentError if source.nil?
    raise ArgumentError if !target.nil? && source > target

    @stacks[last].push(@stacks[first].pop)
  end

  def get_move
    puts "Enter a move: (ex. 1,3)"
    input = gets.chomp
    parsed = input.split(',').map { |el| el.to_i - 1 }
    raise ArgumentError unless parsed.length == 2 && parsed.all? { |el| el.between?(0, 2) }
    parsed
  end

  def render
    puts @stacks.map(&:inspect).join(" | ")
  end

  private

  def won?
    @stacks[1..2].any? { |stack| stack == [3, 2, 1] }
  end
end

if __FILE__ == $PROGRAM_NAME
  Hanoi.new.play
end
