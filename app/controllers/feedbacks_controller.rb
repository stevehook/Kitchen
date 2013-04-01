class FeedbacksController < ApplicationController
  def new
    @category = params[:category]
    @feedback = Feedback.new(category: @category)
    render
  end

  def create
    feedback = Feedback.new params[:feedback]
    success = feedback.save
    @category = feedback.category
    if request.xhr?
      @feedback = success ? Feedback.new(category: @category) : feedback
      if success
        @notice = "Thanks for your interest. We will get back to you when we are ready to launch this service."
      else
        @error = "There was a problem recording your feedback. #{@feedback.errors.full_messages.join(', ')}."
      end
    end
  end
end

