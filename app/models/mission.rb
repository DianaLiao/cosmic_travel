class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :scientist_id, :planet_id, presence: true
  validates :name, uniqueness: { case_sensitive: false, message: "That mission name has already been used."}
end
