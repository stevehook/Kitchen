class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |s|
      s.string :name
      s.string :email
      s.string :category
      s.string :postcode

      s.timestamps
    end
  end
end
