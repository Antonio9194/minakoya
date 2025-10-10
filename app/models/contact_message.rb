class ContactMessage < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true, length: { maximum: 400 }
end
