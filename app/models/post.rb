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

  def display_to_json
    Jbuilder.encode do |json|
      json.id id
      json.title title
      json.body body
      json.created_at created_at
      json.updated_at updated_at
    end
  end
end
