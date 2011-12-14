require 'spec_helper'

describe "Episodes" do
  describe "GET /episodes" do
    it "display some episodes" do
    	visit episodes_path
    	page.should have_content 'Jericho'
    end
  end
end
