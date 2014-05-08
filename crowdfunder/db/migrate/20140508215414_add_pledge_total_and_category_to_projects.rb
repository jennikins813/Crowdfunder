class AddPledgeTotalAndCategoryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pledge_total, :integer
    add_column :projects, :category, :string
  end
end
