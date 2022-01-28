# frozen_string_literal: true

module Spina
  module Admin
    module Conferences
      module Blog
        # A component for switching translations, mimicking Spina::Pages::TranslationsComponent.
        # Model must be either a {Spina::Admin::Conferences::Blog::Category} or a
        # {Spina::Admin::Conferences::Blog::Post}
        class TranslationsComponent < ApplicationComponent
          def initialize(model, label: nil)
            @model = model
            @label = label
          end
          
          def render?
            spina_locales.many?
          end
      
          def missing_locales
            spina_locales - existing_locales
          end
      
          def existing_locales
            @existing_locales ||= @model.translations.pluck(:locale).map(&:to_sym).sort_by do |locale|
              spina_locales.index(locale)
            end
          end

          def generate_edit_link(locale)
            return helpers.spina.edit_admin_conferences_blog_category_path(@model.id, locale: locale) if @model.is_a? Category
            return helpers.spina.edit_admin_conferences_blog_post_path(@model.id, locale: locale) if @model.is_a? Post
          end
      
          private
      
          def spina_locales
            Spina.config.locales.map(&:to_sym)
          end
        end
      end
    end
  end
end
