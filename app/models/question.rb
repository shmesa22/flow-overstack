class Question < ApplicationRecord
  validates :name, :description, presence: true
end
