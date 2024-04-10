# fronze_string_literal: true
SimpleCov.minimum_coverage 100

SimpleCov.start 'rails' do
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Services', 'app/services'

  # used when ignore files or directory
  add_filter '/app/controllers/application_controller.rb'
  add_filter '/app/models/application_record.rb'
  add_filter '/app/channels/application_cable/channel.rb'
  add_filter '/app/channels/application_cable/connection.rb'
  add_filter '/app/jobs/application_job.rb'
  add_filter '/app/mailers/application_mailer.rb'
end
