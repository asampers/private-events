class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
  validates :location, presence: true

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :invites
  has_many :attendees, through: :invites, source: :user
end
