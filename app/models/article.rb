class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  def self.search(title)
    where(["title like ? ", "%#{title}%"])
  end

end
