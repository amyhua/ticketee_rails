require 'spec_helper'

feature "Viewing projects" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:project) { Factory(:project) }
  let!(:project_2) { Factory(:project, :name => "Internet Explorer")}
  
  before do
    sign_in_as!(user)
    define_permission!(user, :show, project)
    visit '/'
    page.should_not have_content "Internet Explorer"
  end
  
  scenario "Listing all projects" do
    visit '/'
    click_link project.name
    page.current_url.should == project_url(project)
  end
end