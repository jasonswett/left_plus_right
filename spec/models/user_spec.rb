require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.build(:user)
  end

  subject { @user }

  it { should be_valid }

  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when occupation is not present" do
    before { @user.occupation = " " }
    it { should_not be_valid }
  end

  describe "when role is not present" do
    before { @user.role = nil }
    it { should_not be_valid }
  end

  describe "when there's already a user with the exact same name and occupation" do
    before do
      duplicate_user = @user.dup
      duplicate_user.update_attributes!(
        first_name: @user.first_name,
        last_name: @user.last_name,
        occupation: @user.occupation
      )
    end

    it { should_not be_valid }
  end
end
