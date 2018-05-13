['../src','../src/coupons'].each{ |dir| $LOAD_PATH << File.expand_path(dir, __FILE__)}

require 'bundler/setup'
require 'yaml'
require 'uri'
require 'net/http'
require 'json'
require 'date'
require 'command_line_parser'
require "coupons"
require "discount_coupon"
require "cart"
require "product"
require 'discount_engine'
require 'percentage'
require 'discount'
require 'discount_cashback'
require 'percentage_cashback'
require 'bogo'
require 'console'
require 'fileout'
require 'output_delegator'
require 'runner'