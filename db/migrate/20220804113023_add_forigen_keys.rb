class AddForigenKeys < ActiveRecord::Migration[5.2]
  def change
    def change
      add_foreign_key :bugs, :users
      add_foreign_key :bugs, :projects
    end
  end
end
