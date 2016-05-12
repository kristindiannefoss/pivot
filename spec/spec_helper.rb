RSpec.configure do |config|
  config.mock_with :mocha
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
