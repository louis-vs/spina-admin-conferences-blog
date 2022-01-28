# frozen_string_literal: true

module Spina
  module Admin::Conferences::Blog
    # Spina::Blog::Category
    class Category < ApplicationRecord
      extend FriendlyId

      friendly_id :name, use: :slugged

      has_many :posts, class_name: 'Spina::Admin::Conferences::Blog::Post', inverse_of: :category
      validates :name, presence: true, uniqueness: { case_sensitive: false }

      translates :name, fallbacks: true

      def to_s
        name
      end

      def self.table_name
        'spina_blog_categories'
      end
    end
  end
end
