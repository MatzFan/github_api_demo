class Repo < ActiveRecord::Base

  validates :id, presence: true, uniqueness: true

end
