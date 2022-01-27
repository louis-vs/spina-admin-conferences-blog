# frozen_string_literal: true

module Spina
  module Admin::Conferences::Blog
    # Spina::Blog::Engine
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Admin::Conferences::Blog

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'conferences-blog'
          plugin.namespace = 'conferences/blog'
        end
        
        # Add views for purging Tailwind classes
        ::Spina.config.tailwind_purge_content.concat Spina::Blog::Engine.root.glob("app/views/**/*.*")
      end

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.fixture_replacement :factory_bot, dir: 'spec/factories'
        g.assets false
        g.helper false
      end
    end
  end
end
