require 'spec_helper'

describe 'View existing subscriptions' do

  before do
  end

  context 'when not logged in' do
    it 'we cannot navigate to the subscriptions path' do
      visit subscriptions_path
      current_path.should_not == subscriptions_path
    end
  end

  context 'when logged in' do
    include_context :authentication

    it 'we can navigate to the subscriptions path' do
      visit subscriptions_path
      current_path.should == subscriptions_path
    end

    context 'with 3 subscriptions' do
      let(:subscriptions) { [
          Subscription.create!(name: 'Bob', email: 'bob@example.com'),
          Subscription.create!(name: 'Alice', email: 'alice@example.com'),
          Subscription.create!(name: 'Jim', email: 'james@example.com')
        ]
      }

      before do
        Subscription.any_instance.stub(:test_spam) { true }
        subscriptions
        visit subscriptions_path
      end

      it 'shows the name of each subscriber' do
        subscriptions.each do |subscription|
          page.should have_content(subscription.name)
        end
      end

      it 'shows the email addresses of each subscriber' do
        subscriptions.each do |subscription|
          page.should have_content(subscription.email)
        end
      end

      it 'shows the subscription date of each subscriber' do
        subscriptions.each do |subscription|
          page.should have_content(subscription.created_at)
        end
      end
    end
  end
end

describe 'View feedback' do

  before do
  end

  context 'when not logged in' do
    it 'we cannot navigate to the feedbacks path' do
      visit feedbacks_path
      current_path.should_not == feedbacks_path
    end
  end

  context 'when logged in' do
    include_context :authentication

    it 'we can navigate to the feedbacks path' do
      visit feedbacks_path
      current_path.should == feedbacks_path
    end

    context 'with 3 feedbacks' do
      let(:feedbacks) { [
          Feedback.create!(name: 'Bob', email: 'bob@example.com', category: 'classes', phone: '0123456789', postcode: 'AB1 1BA'),
          Feedback.create!(name: 'Alice', email: 'alice@example.com', category: 'delivery', phone: '0987654321', postcode: 'AB1 1BA'),
          Feedback.create!(name: 'Jim', email: 'james@example.com', category: 'classes', phone: '', postcode: '')
        ]
      }

      before do
        Feedback.any_instance.stub(:test_spam) { true }
        feedbacks
        visit feedbacks_path
      end

      it 'shows the name of each contact' do
        feedbacks.each do |feedback|
          page.should have_content(feedback.name)
        end
      end

      it 'shows the email addresses of each contact' do
        feedbacks.each do |feedback|
          page.should have_content(feedback.email)
        end
      end

      it 'shows the phone number of each contact' do
        feedbacks.each do |feedback|
          page.should have_content(feedback.phone)
        end
      end

      it 'shows the postcode of each contact' do
        feedbacks.each do |feedback|
          page.should have_content(feedback.postcode)
        end
      end

      it 'shows the category of each contact' do
        feedbacks.each do |feedback|
          page.should have_content(feedback.category)
        end
      end

      it 'shows the feedback date of each contact' do
        feedbacks.each do |feedback|
          page.should have_content(feedback.created_at)
        end
      end
    end
  end
end

