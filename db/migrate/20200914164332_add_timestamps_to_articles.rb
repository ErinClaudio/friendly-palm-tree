class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :description, :text
    add_column :articles, :created_id, :datetime
    add_column :articles, :updated_at, :datetime
  end
end