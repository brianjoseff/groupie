# Load the rails application
require File.expand_path('../application', __FILE__)
require "aws/s3"
ENV['AMAZON_ACCESS_KEY'] = 'AKIAIDQFQL6U46ZQT3AA'
ENV['AMAZON_SECRET_KEY'] = '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'



# Initialize the rails application
Groupie::Application.initialize!

