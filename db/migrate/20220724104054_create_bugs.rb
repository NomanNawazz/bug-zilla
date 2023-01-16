# frozen_string_literal: true

# Migration to create Bugs ActiveRecord
class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false, default: ''
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :status, null: false, default: 0
      t.integer :bug_type, null: false, default: 0
      t.string :description, null: false, default: ''
      t.timestamps
    end
  end
end
