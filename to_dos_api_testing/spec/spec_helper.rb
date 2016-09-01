require 'rspec'

require 'to_dos_api_tests'

RSpec.configure do|config|
	config.color = true
	config.tty = true
	config.formatter = :documentation
end