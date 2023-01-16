# frozen_string_literal: true

# Migration to create User and Project Join table
class CreateUsersProjectsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :projects, null: false
  end
end
