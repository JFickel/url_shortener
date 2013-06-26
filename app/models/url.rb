class Url < ActiveRecord::Base
  validates :long_url, presence: true, format: { with: /^https?:\/\/.+(.com|.net|.org|.gov|.edu|.io)/ }
end
