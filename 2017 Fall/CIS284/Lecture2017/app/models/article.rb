class Article < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :published_date, presence: true
  validates :published, presence: true
  validates :context, presence: true
  validates :avatar_url, :allow_blank => true, url: true
end
