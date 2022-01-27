# frozen_string_literal: true

RSpec.configure do |c|
  c.before(:each, type: :system) do
    driven_by :rack_test
  end

  c.before(:each, type: :system, js: true) do
    driven_by :selenium, using: :headless_firefox, screen_size: [1400, 800]
  end
end
