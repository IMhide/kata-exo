#
# Requiring Your Gemfile
#

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

#
# Require all the module you're creating here
#

require_relative './lib/balance_sheet'

#
# v  Write your main loop downhere v
#

BalanceSheet::Generator.call(input_path: 'data/input.json')
