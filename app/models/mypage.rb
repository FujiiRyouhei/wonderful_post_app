class Article < ApplicationRecord
  def self.search(title)
    where(["title like ? ", "%#{title}%"])
  end

end
