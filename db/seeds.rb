# frozen_string_literal: true

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/seeds/*.rb').each { |f| require f }
