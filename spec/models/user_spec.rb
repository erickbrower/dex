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
  it { should respond_to(:tokens) }

  describe "when email is not present" do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe "when email is the wrong format" do
    before { @user.email = '12345' }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = '' }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before do 
      @user.password = '12345'
      @user.password_confirmation = '12345'
    end
    it { should_not be_valid }
  end

  describe "when password_confirmation is not present" do
    before { @user.password_confirmation = '' }
    it { should_not be_valid }
  end
end
