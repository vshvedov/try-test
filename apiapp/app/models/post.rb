class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :content, :user_id, presence: true

  resourcify
end
