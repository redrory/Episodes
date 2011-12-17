require 'spec_helper'

describe "Episodes" do
  describe "GET /episodes" do
    it "display some episodes" do

    	@episode = Episode.create :title => "Jericho"
    	visit episodes_path
    	page.should have_content 'Jericho'
    end

    it "creates a new episode" do
    	visit episodes_path
    	fill_in "Title", :with => 'The Closer'
    	click_button 'Create Episode'

    	current_path.should == episodes_path
    	page.should have_content 'The Closer'

    	save_and_open_page

    end
  end
end
