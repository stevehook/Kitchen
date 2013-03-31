require 'spec_helper'

describe Feedback do

  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :category }
  it { should validate_presence_of :email }
  it { should validate_presence_of :category }
  it { should_not validate_presence_of :name }
  it { should respond_to :name, :email, :category, :created_at, :updated_at }
  it { should validate_format_of(:email).not_with('hello').with_message(/invalid/) }
  it { should ensure_inclusion_of(:category).in_array(%w{classes delivery}) }
end
