require 'spec_helper'
require 'spam_filter'

#class Model
  #include ActiveModel::Naming
  #include ActiveModel::Validations
  #attr_accessor :name, :email
  #include ::SpamFilter
#end

#describe SpamFilter do

  #subject { Model.new }

  #describe '#form_submitted_to_fast' do
    #context 'when form submitted within one second' do
      #subject(:model) { Model.new(:submitted_timestamp => DateTime.new(2013, 1, 1, 12, 0, 0), :initial_timestamp => DateTime.new(2013, 1, 1, 12, 0, 1)) }
      #it 'fails' do
        #model.send(:form_submitted_to_fast).should be_true
      #end
    #end

    #context 'when form submitted after ten seconds' do
      #subject(:model) { Model.new(:submitted_timestamp => DateTime.new(2013, 1, 1, 12, 0, 0), :initial_timestamp => DateTime.new(2013, 1, 1, 12, 0, 10)) }
      #it 'passes' do
        #model.send(:form_submitted_to_fast).should be_false
      #end
    #end
  #end

#end
