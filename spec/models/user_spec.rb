require 'spec_helper'
require 'factories'

describe User do
  before { @user = FactoryGirl.create(:user) }
  
  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  describe "when email is not present" do
    before { @user.email = '' }
    it { should_not be_valid }
  end
end
