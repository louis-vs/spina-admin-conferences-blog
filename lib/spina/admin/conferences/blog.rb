# frozen_string_literal: true

require 'friendly_id'
require 'draper'
require 'spina'
require 'nokogiri'

module Spina
  # Spina::Blog
  module Admin
    module Conferences
      module Blog
        require 'spina/admin/conferences/blog/engine'
        require 'spina/admin/conferences/blog/configuration'
      end
    end
  end
end
