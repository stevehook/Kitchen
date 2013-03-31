class Feedback < ActiveRecord::Base
  attr_accessible :name, :email, :category, :postcode
  validates_presence_of :email
  validates_presence_of :category
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create 
  validates :category, :inclusion => { :in => %w{classes delivery} }
end

