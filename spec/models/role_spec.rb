require 'spec_helper'

describe Role do
  before do
    @role = FactoryGirl.build(:role)
  end

  subject { @role }

  it { should be_valid }

  describe "when name is not present" do
    before { @role.name = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      role_with_same_name = @role.dup
      role_with_same_name.name = @role.name.upcase
      role_with_same_name.save
    end

    it { should_not be_valid }
  end
end
