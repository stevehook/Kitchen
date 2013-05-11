module SpamFilter
  extend ActiveSupport::Concern

  included do
    attr_accessor :initial_timestamp, :submitted_timestamp, :other
    attr_accessible :initial_timestamp, :other
    before_save :test_spam
  end

  def initialize(attributes = {}, *args)
    self.initial_timestamp = DateTime.now
    self.submitted_timestamp = initial_timestamp
    super
  end

  def test_spam
    spam = (
      link_detected ||
      form_submitted_to_fast ||
      hidden_field_present ||
      timestamp_missing
    )
    errors.add(:base, 'Are you human?')
    return !spam
  end

  def text_attributes
    [:name, :email]
  end

  private

  TO_FAST_THRESHOLD = 5

  def link_detected
    text_attributes.any? do |attr|
      self.try(attr).to_s.match( %r{</a>} )
    end
  end

  def form_submitted_to_fast
    self.submitted_timestamp = DateTime.parse(submitted_timestamp) if submitted_timestamp.kind_of?(String)
    self.initial_timestamp = DateTime.parse(initial_timestamp) if initial_timestamp.kind_of?(String)
    (submitted_timestamp.to_i - initial_timestamp.to_i) < TO_FAST_THRESHOLD
  end

  def hidden_field_present
    self.other.present?
  end

  def timestamp_missing
    self.initial_timestamp.blank?
  end
end
