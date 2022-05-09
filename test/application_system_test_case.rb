require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers
  # ブラウザを開いてテストを実行する
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  # headless chromeを使ってテストを実行する
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
