class AddSeasonToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :season, :integer
    add_column :episodes, :number, :integer
  end
end
