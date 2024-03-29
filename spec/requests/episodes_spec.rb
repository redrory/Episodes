require 'spec_helper'

describe "Episodes" do

    before do
        @episode = Episode.create :title => "Jericho", :season => 1, :number => 2 
    end

  describe "GET /episodes" do
    it "display some episodes" do

    	@episode = Episode.create :title => "Jericho", :season => 1, :number => 2
    	visit episodes_path
    	page.should have_content 'Jericho'
    end

    it "creates a new episode" do
    	visit episodes_path
    	fill_in "Title", :with => 'The Closer'
        fill_in "Season", :with => 5
        fill_in "Number", :with => 2

    	click_button 'Create Episode'

    	current_path.should == episodes_path
    	page.should have_content 'The Closer'
        page.should have_content '5'
        page.should have_content '2'

    end
  end

  describe "PUT /episodes" do
    it "edits a episode" do
        visit episodes_path
        click_link "Edit"

        current_path.should == edit_episode_path(@episode)
        #page.should have_content 'Louie'
        find_field('Title').value.should == 'Jericho'

        fill_in 'Title', :with => 'updated title'
        click_button 'Update Episode'

        current_path.should == episodes_path

        page.should have_content 'updated title'
    end

    it "should not update an empty task" do
        visit episodes_path
        click_link 'Edit'

        fill_in 'Title',:with => ''
        fill_in 'Season',:with => ''
        fill_in 'Number',:with => ''

        click_button 'Update Episode'

        current_path.should == edit_episode_path(@episode)
        page.should have_content 'There was an error updating episode'
    end

    it "should check seen it on an episode" do
        visit episodes_path
        click_link 'Watch'

        current_path.should == episodes_path
        page.should have_content 'You saw that episode'


    end
end

    describe "DELETE /episode" do
        it "should delete a task" do
            visit episodes_path
            find("#episode_#{@episode.id}").click_link 'Delete'

            page.should have_content 'Episode has been deleted'
            page.should have_no_content 'The Closer'
        end
    end





end





