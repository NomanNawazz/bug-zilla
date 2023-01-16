# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates_uniqueness_of :email

  has_many :bugs, dependent: :nullify
  has_many :projects, foreign_key: "manager_id", dependent: :destroy
  has_and_belongs_to_many :projects
  enum role: { manager: 0, developer: 1, sq: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
