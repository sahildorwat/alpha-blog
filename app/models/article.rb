class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    validates :user_id, presence: true
    validates :title, presence: true, length: {minimum:3, maximum:10}
    validates :description, presence: true, length: {minimum:3, maximum:10}
end