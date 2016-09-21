require 'towers_of_hanoi'


describe Hanoi do
  subject(:hanoi) { Hanoi.new }

  describe "#initialize" do
    it "should create three stacks with three discs on the first" do
      expect(hanoi.stacks).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#render" do
    it "correctly renders the stacks" do
      expect(STDOUT).to receive(:puts).with("[3, 2, 1] | [] | []")
      hanoi.render
    end
  end

  describe "#move" do
    it "moves a disc from stack one to stack three" do
      hanoi.move(0, 2)
      expect(hanoi.stacks).to eq([[3, 2], [], [1]])
    end

    it "raises an error when placing a bigger disc on a smaller" do
      hanoi.move(0, 2)
      expect do
        hanoi.move(0, 2)
      end.to raise_error(ArgumentError)
    end

    it "raises an error if attempting to move a disc from an empty stack" do
      expect { hanoi.move(2, 0) }.to raise_error(ArgumentError)
    end
  end

  describe "#get_move" do

    it "calls gets" do
      expect(hanoi).to receive(:gets).and_return("1,3")
      hanoi.get_move
    end

    it "prompts the user for input" do
      expect(STDOUT).to receive(:puts).with("Enter a move: (ex. 1,3)")
      expect(hanoi).to receive(:gets).and_return("1,3")
      hanoi.get_move
    end

    it "correctly parses user input" do
      expect(hanoi).to receive(:gets).and_return("1,3\n")
      expect(hanoi.get_move).to eq([0,2])
    end

    it "raises an error given incorrect input" do
      expect(hanoi).to receive(:gets).and_return("1 3\n")
      expect { hanoi.get_move }.to raise_error(ArgumentError)
    end
  end

  describe "#play_turn" do
    it "calls #get_move" do
      expect(hanoi).to receive(:get_move).and_return([0, 2])
      hanoi.play_turn
    end

    it "changes the stacks" do
      expect(hanoi).to receive(:get_move).and_return([0, 2])
      hanoi.play_turn
      expect(hanoi.stacks).not_to eq([[3, 2, 1], [], []])
    end
  end

  describe "#play" do
    it "doesn't call #play_turn if #won is true" do
      expect(hanoi).to receive(:won?).and_return(true)
      expect(hanoi).not_to receive(:play_turn)
      hanoi.play
    end
  end

end
