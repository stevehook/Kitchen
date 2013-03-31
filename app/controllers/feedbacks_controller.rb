class FeedbacksController < ApplicationController
  def create
    #subscription = Subscription.new params[:subscription]
    #success = subscription.save
    #UserMailer.welcome_email(subscription).deliver if success
    #if request.xhr?
      #@subscription = success ? Subscription.new : subscription
      #if success
        #@notice = "Thankyou, you are now subscribed to zanzaneet.com"
      #else
        #@error = "Your subscription could not be created. #{subscription.errors.full_messages.join(', ')}."
      #end
    #else
      #if success
        #redirect_to root_path + '#contact', :notice => 'Thankyou, you are now subscribed to zanzaneet.com'
      #else
        #flash[:error] = "Your subscription could not be created. #{subscription.errors.full_messages.join(', ')}."
        #redirect_to root_path + '#contact'
      #end
    #end
  end

  def new
    @feedback = Feedback.new(category: params[:category])
    render @feedback.category
  end

  def create
  end
end

