# frozen_string_literal: true

# Project Model
class Project < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 15 }, uniqueness: true
  has_and_belongs_to_many :users, -> { distinct }

  has_many :bugs, dependent: :destroy
  belongs_to :manager, class_name: :User, foreign_key: "manager_id"
  # has_many :users, class_name: "user", foreign_key: "user_id"
end
