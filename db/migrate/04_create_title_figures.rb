
class CreateTitleFigures < ActiveRecord::Migration
  def change
    create_table :title_figures do |t|
      t.belongs_to :figure
      t.belongs_to :title
    end
  end
end
