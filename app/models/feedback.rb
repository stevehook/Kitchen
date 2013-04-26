require 'spam_filter'

class Feedback < ActiveRecord::Base
  EMAIL_REGEX = '([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})'
  PHONE_REGEX = '[\(]?\d{2,5}[\)]?[ ]?\d{2,10}'
  POSTCODE_REGEX = '(GIR 0AA)|((([a-zA-Z]{1,2}[0-9][0-9]?))[ ]?[0-9][a-zA-Z]{2})'

  attr_accessible :name, :email, :category, :postcode, :phone
  validates_presence_of :email
  validates_presence_of :category
  validates_format_of :email, :with => Regexp.new(EMAIL_REGEX), :on => :create
  validates :category, :inclusion => { :in => %w{classes delivery} }

  include SpamFilter

  def text_attributes
    %w{name email category postcode}
  end
end

