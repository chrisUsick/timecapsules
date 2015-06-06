require 'test_helper'
require 'generators/mailer/mailer_generator'

class MailerGeneratorTest < Rails::Generators::TestCase
  tests MailerGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
