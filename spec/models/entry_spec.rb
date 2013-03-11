require 'spec_helper'

describe Entry do
  before { @entry = FactoryGirl.create(:entry) }

  subject { @entry } 

  it { should respond_to(:content) }
  it { should respond_to(:title) }
  it { should respond_to(:etype) }

  describe "when content is empty" do
    before { @entry.content = '' }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @entry.title = '' }
    it { should_not be_valid }
  end

  describe "when etype is not present" do
    before { @entry.etype = '' }
    it { should_not be_valid }
  end
end
