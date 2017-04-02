# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Question < ApplicationRecord
  belongs_to :user
  
  validates :name, :description, presence: true
end
