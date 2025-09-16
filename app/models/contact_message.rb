class ContactMessage < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true, length: { maximum: 400 }
end
