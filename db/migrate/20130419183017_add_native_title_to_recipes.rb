class AddNativeTitleToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :native_title, :string
  end
end
