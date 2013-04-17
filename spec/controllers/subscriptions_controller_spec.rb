require 'spec_helper'

describe SubscriptionsController do
  before do
    Subscription.any_instance.stub(:id) { 1 }
  end

  describe "POST 'create'" do
    it "redirects to '/' and sets notice on successful save" do
      Subscription.any_instance.stub(:save) { true }
      post :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should redirect_to("#{root_path}#contact")
      flash[:notice].should == 'Thank you, you are now subscribed to zanzaneet.com'
    end

    it "redirects to '/' and sets error on unsuccessful save" do
      Subscription.any_instance.stub(:save) { false }
      post :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should redirect_to("#{root_path}#contact")
      flash[:error].should match(/Your subscription could not be created/)
    end
  end

  describe "POST 'create' with Ajax" do
    it "returns success on successful save" do
      Subscription.any_instance.stub(:save) { true }
      xhr :post, :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should be_success
      subscription = assigns[:subscription]
      subscription.should_not be_nil
      subscription.name.should be_blank
      subscription.email.should be_blank
    end

    it "returns failure on unsuccessful save", :focus do
      Subscription.any_instance.stub(:save) { false }
      xhr :post, :create, :subscription => { :name =>  "", :email => "bob@roberts.com" }
      response.should be_success
      subscription = assigns[:subscription]
      subscription.should_not be_nil
      subscription.name.should be_blank
      subscription.email.should == 'bob@roberts.com'
    end
  end
end
