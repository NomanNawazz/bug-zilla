# frozen_string_literal: true

# Create Project Migration
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false, default: ''
      t.integer :manager_id
      t.timestamps
    end
  end
end
