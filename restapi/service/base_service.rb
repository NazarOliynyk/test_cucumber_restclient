require_relative("../reader/file_reader.rb")
require_relative("../client/api_client.rb")
require 'yaml'

class Base_service

  attr_accessor :file_reader, :api_client, :author_model, :book_model, :genre_model, :test_data, :default_login, :default_password

  def initialize
    @test_data = YAML.load(File.read(Dir.getwd + "/restapi/testdata/restapi_testdata.yml"))
    @file_reader = File_reader.new
    @api_client = ApiClient.new
    @author_model = file_reader.readData( Dir.getwd + "/restapi/model/author.json")
    @book_model = file_reader.readData(Dir.getwd + "/restapi/model/book.json")
    @genre_model = file_reader.readData(Dir.getwd + "/restapi/model/genre.json")
    @main_url = test_data[:main_url]
    @default_login = test_data[:default_login]
    @default_password = test_data[:default_password]
  end

  def get_token(user_data, headers)
    api_client.post_request((@main_url + "login"),
                            user_data,
                            headers,
                            10,
                            10)
  end

end

