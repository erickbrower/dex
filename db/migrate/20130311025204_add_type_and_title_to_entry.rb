class AddTypeAndTitleToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :title, :string
    add_column :entries, :etype, :string
  end
end
