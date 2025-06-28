class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :attachments, dependent: :destroy
end
