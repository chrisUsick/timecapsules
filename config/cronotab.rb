# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
# #
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end

# Crono.perform(TestJob).every 2.seconds
#
Crono.perform(SendEmailsJob).every 30.seconds
# Crono.perform(SendEmailMonthlyJob).every 30.days
# Crono.perform(SendEmailYearlyJob).every 365