require 'spec_helper'
require 'factories'

describe Token do
  before { @token = FactoryGirl.create(:token) }
  subject { @token }

  it { should respond_to(:value) }
  it { should respond_to(:user) }
  it { should respond_to(:active?) }

  describe "generating token values on before_create" do
    before { @token.save }
    specify { @token.value.should_not be_nil }
  end
end
