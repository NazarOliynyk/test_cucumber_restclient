require 'rubygems'
require 'httparty'
require 'allure-cucumber'
require 'logger'
require_relative(Dir.getwd + '/restapi/service/base_service.rb')

base_service = Base_service.new
@token = ''
log = Logger.new('log.txt')
log.debug("Created Logger")

Before do
  response = base_service.get_token({"username": base_service.default_login, "password": base_service.default_password}, {content_type: 'application/json'})
  expect(response).not_to eql('Error: 403 Forbidden')
  log.info("Before method")
  @token = JSON.parse(response.headers.to_json)['authorization']
end