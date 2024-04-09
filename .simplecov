# fronze_string_literal: true
SimpleCov.minimum_coverage 100

SimpleCov.start 'rails' do
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Business', 'app/business'

  # used when ignore files or directory
  add_filter '/app/controllers/application_controller.rb'
  add_filter '/app/models/application_record.rb'
end
