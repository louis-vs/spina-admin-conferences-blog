# frozen_string_literal: true

require 'spina'
require 'spina/admin/conferences/blog/configuration'
require 'spina/admin/conferences/blog/version'
require 'spina/admin/conferences/blog/engine'
require 'friendly_id'
require 'draper'
require 'spina'
require 'nokogiri'

module Spina
  # Spina::Blog
  module Admin
    module Conferences
      module Blog
        def self.table_name_prefix
          'spina_blog_'
        end
      end
    end
  end
end
