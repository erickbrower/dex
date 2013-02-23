require 'spec_helper'

describe Entry do
  before { @entry = Entry.new(content: "This is a test!") }

  subject { @entry } 

  it { should respond_to(:content) }
end
