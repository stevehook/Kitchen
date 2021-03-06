require 'spec_helper'

describe Subscription do

  before { Subscription.any_instance.stub(:test_spam).and_return(true) }

  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :name }
  it { should validate_presence_of :email }
  it { should_not validate_presence_of :name }
  it { should respond_to :name, :email, :created_at, :updated_at }
  it { should validate_format_of(:email).not_with('hello').with_message(/invalid/) }

  context 'uniqueness constraints' do
    before { Subscription.create! :email => 'bob@example.com', :name => 'bob' }
    it { should validate_uniqueness_of :email }
  end

  context "business logic validation when CREATING subscription" do
    before do
      @subscriber = Subscription.create! :name => 'rob', :email => 'rob@g.com'
    end

    it "should throw an exception when the same subscriber registers twice" do
      -> { subscriber = Subscription.create! :name => 'rob', :email => 'rob@g.com' }.should raise_error
    end
  end
end
