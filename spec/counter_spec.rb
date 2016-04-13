require "./counter"

RSpec.describe Counter, "counter" do
  before do
    @counter = Counter.new
  end

  it "starts with zero" do
    expect(@counter.value).to eq 0
  end

  it "increments by one" do
    @counter.inc
    expect(@counter.value).to eq 1
    @counter.inc
    expect(@counter.value).to eq 2
  end
end
