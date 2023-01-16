# frozen_string_literal: true

# Add Deadline to Bugs
class AddDeadlineToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :deadline, :datetime
  end
end
