# frozen_string_literal: true

# Bug Model
class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :image
  validates :deadline, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :bug_type, presence: true


  validates :title, presence: true, length: { minimum: 2, maximum: 15 }
  enum status: { New: 0, started: 1, completed: 2, resolved: 3 }
  enum bug_type: { bug: 0, feature: 1 }

  validate :image_type
  validate :must_have_valid_future_date

  private

  def image_type
    if image.attached?
    return if image.content_type.in?(%w['image/jpeg image/png image/jpg'])
    
    end
  end

  def must_have_valid_future_date
    return if deadline.blank? || deadline > Time.zone.today

    errors.add(:deadline, 'date cannot be in past')
  end
end
