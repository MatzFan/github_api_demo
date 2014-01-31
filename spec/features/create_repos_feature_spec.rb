require 'spec_helper'

describe "creating repos from GitHub API" do
  context "by cURL on a gven user" do
    specify "should result in all of that users repos dispalyed at /repos/index" do
      visit '/'
      click_link 'Download repos'
      expect(current_path).to eq(repos_index_path)
      expect(page).to have_content('airport')
    end
  end
end # of describe
