class FeedbacksController < ApplicationController
  #def create
    ##subscription = Subscription.new params[:subscription]
    ##success = subscription.save
    ##UserMailer.welcome_email(subscription).deliver if success
    ##if request.xhr?
      #@subscription = success ? Subscription.new : subscription
      #if success
        #@notice = "Thankyou, you are now subscribed to zanzaneet.com"
      #else
        #@error = "Your subscription could not be created. #{subscription.errors.full_messages.join(', ')}."
      #end
    ##else
      ##if success
        ##redirect_to root_path + '#contact', :notice => 'Thankyou, you are now subscribed to zanzaneet.com'
      ##else
        ##flash[:error] = "Your subscription could not be created. #{subscription.errors.full_messages.join(', ')}."
        ##redirect_to root_path + '#contact'
      ##end
    ##end
  #end

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

