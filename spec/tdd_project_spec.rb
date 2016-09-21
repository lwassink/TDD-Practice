require 'tdd_project'

describe Array do
  describe "#remove_dups" do
    let(:dup_array) { [1,3,1,4,4,2,3,2] }
    let(:non_dup_array) { [1,2,3,4] }

    it "removes duplicates" do
      expect(dup_array.remove_dups).to eq([1,3,4,2])
    end

    it "does not change unique arrays" do
      expect(non_dup_array.remove_dups).to eq(non_dup_array)
    end
  end

  describe "#two_sum" do
    let(:array) { [-1, 0, 2, -2, 1] }

    it "returns the correct sum indices" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    let(:one_dim) { [1, 2, 3] }
    let(:rows) do
      [[0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]]
    end

    let(:cols) do
      [[0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]]
    end

    it "should properly transpose a given array" do
      expect(rows.my_transpose).to eq(cols)
    end

    it "should properly transpose a one dimensional array" do
      expect(one_dim.my_transpose).to eq([[1], [2], [3]])
    end
  end

  describe "#stock_picker" do
    let(:stock) { [1, 2, -3, 12, 2, 15] }

    it "picks the correct days to buy and sell" do
      expect(stock.stock_picker).to eq([2, 5])
    end
  end
end
