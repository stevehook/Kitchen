require 'spec_helper'


describe 'Home page' do
  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "with a recipe" do
    before do
      @recipe = Recipe.create!(:title => 'Aloo tikki chaat', :synopsis => 'Yummy street food',
       :ingredient_list => 'secret', :preparation_method => 'secret')
    end

    it 'should show a page header' do
      visit '/'
      page.should have_content "Zanzaneet"
    end

    it "should have a link to the home page" do
      visit '/'
      page.should have_link 'Home'
      click_link 'Home'
      current_path.should == root_path
    end

    it "should have a link to the recipes list" do
      visit '/'
      page.should have_link 'Recipes'
      click_link 'Recipes'
      current_path.should == root_path
    end

    it "should have recipes" do
      visit '/'
      page.should have_content @recipe.title
      page.should have_content @recipe.synopsis
    end

    it 'should have a link to the recipe show page' do
      visit '/'
      click_link 'view all recipes'
      current_path.should == recipes_path
    end
  end

  it "should have last 1 tweet" do
    visit '/'
    # @tweets[0..2].each { |tweet| page.should have_content tweet }
    page.should have_content @tweets[0]
    page.should_not have_content @tweets[1]
  end

  context "contact us section" do
    it "should show subscription form with name field" do
      visit '/'
      page.should have_field 'Name'
    end

    it "should show subscription form with name field" do
      visit '/'
      page.should have_field 'Email'
    end

    context "with valid subscription details" do
      before do
        Subscription.any_instance.stub(:test_spam).and_return(true)
        visit '/'
        fill_in 'Email', :with => 'puppy@woof.com'
        click_button 'Subscribe'
      end

      it "saves a valid subscription" do
        page.current_path.should == root_path
        Subscription.count.should == 1
        page.should have_content 'Thank you, you are now subscribed to zanzaneet.com'
      end

      it "sends a welcome email" do
        ActionMailer::Base.deliveries.count.should == 1
        welcome_email = ActionMailer::Base.deliveries.last
        welcome_email.body.should match "Welcome to Zanzaneet"
      end
    end

    context "with invalid subscription details" do
      before do
        visit '/'
        fill_in 'Email', :with => 'puppy'
        click_button 'Subscribe'
      end

      it "should not save an invalid subscription and throw error" do
        page.current_path.should == root_path
        Subscription.count.should == 0
        page.should have_content 'Your subscription could not be created'
      end

      it "does not send an email" do
        ActionMailer::Base.deliveries.count.should == 0
      end
    end
  end

  describe "footer" do
    before do
      visit '/'
    end

    it 'displays FAQ link' do
      within '#footer' do
        page.should have_link 'FAQ', :href => about_path(:faq)
      end
    end

    it 'displays Privacy policy link' do
      within '#footer' do
        page.should have_link 'Privacy Policy', :href => about_path(:privacy_policy)
      end
    end

    it 'displays About link' do
      within '#footer' do
        page.should have_link 'About', :href => about_path(:about)
      end
    end

    it 'FAQ link displays FAQ page' do
      click_link 'FAQ'
      current_path.should == about_path(:faq)
    end

    it 'Privacy Policy link displays Privacy Policy page' do
      click_link 'Privacy Policy'
      current_path.should == about_path(:privacy_policy)
    end

    it 'About link displays About page' do
      click_link 'About'
      current_path.should == about_path(:about)
    end
  end
end
