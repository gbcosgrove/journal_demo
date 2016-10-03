# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments, as: :commentable

  validates :title, :body, :user_id, presence: true
  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 30 }
end
