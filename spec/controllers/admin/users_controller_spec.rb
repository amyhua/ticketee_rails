require 'spec_helper'

describe Admin::UsersController do
  let(:user) { Factory(:confirmed_user) }
  
  context "signed in standard users" do
    before { sign_in(:user, user) }
    it "are not able to access the index action" do
      get 'index'
      response.should redirect_to('/')
      flash[:alert].should eql("You must be an admin to do that.")
    end
  end

  context "non-signed in standard users" do
    it "must sign up or sign in before accessing the index action" do
      get 'index'
      response.should redirect_to('/users/sign_in')

      flash[:alert].should eql("You need to sign in or sign up before continuing.")
    end
  end



end
