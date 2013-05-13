class AddSlugToRecipesAndBlogPosts < ActiveRecord::Migration
  def change
    add_column :recipes, :slug, :string

    Recipe.find_each(&:save)
    BlogPost.find_each(&:save)

    change_column :recipes, :slug, :string, null: false
    change_column :blog_posts, :slug, :string, null: false

    add_index :recipes, :slug, :unique => true
    add_index :blog_posts, :slug, :unique => true
  end
end
