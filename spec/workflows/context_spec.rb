require "spec_helper"

describe Workflows do
  subject { described_class }

  describe "#run_weekly_workflow" do
    it { should respond_to(:run_weekly_workflow) }

    xit "should send a message to the Weekly workflow"
  end

  describe "#run_daily_workflow" do
    it { should respond_to(:run_daily_workflow) }

    xit "should send a message to the Daily workflow"
  end
end
