require "spec_helper"

describe Activities do
  subject { described_class }
  it { should respond_to(:list_categories) }
  it { should respond_to(:show_log_for) }
  it { should respond_to(:day_log_entries) }

  describe "#list_categories" do
    xit "should send a message to the Object responsible"
  end

  describe "#show_log_for" do
    xit "should send a message to the Object responsible"
  end

  describe "#day_log_entries" do
    xit "should send a message to the Object responsible"
  end
end
