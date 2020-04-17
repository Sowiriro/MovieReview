class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end

  ALLOWED_CONTENT_TYPES = %q{
    image/jpeg
    image/png
    image/gif
    image/bmp
  }
  
end
