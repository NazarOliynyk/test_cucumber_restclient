# frozen_string_literal: true

require 'rubygems'
require 'httparty'
require 'rest-client'

class ApiClient

  def get_request(url, headers, timeout, open_timeout)
    RestClient::Request.execute(method: :get,
                                url: url,
                                headers: headers,
                                timeout: timeout,
                                open_timeout: open_timeout)
  rescue RestClient::ExceptionWithResponse => err
    ('Error: ' + err.to_s)
  end

  def post_request(url, obj, headers, timeout, open_timeout)
    RestClient::Request.execute(method: :post,
                                url: url,
                                payload: obj.to_json,
                                headers: headers,
                                timeout: timeout,
                                open_timeout: open_timeout)
  rescue RestClient::ExceptionWithResponse => err
    ('Error: ' + err.to_s)
  end

  def delete_request(url, id, headers, timeout, open_timeout)
    RestClient::Request.execute(method: :delete,
                                url: url + id.to_s,
                                headers: headers,
                                timeout: timeout,
                                open_timeout: open_timeout)
  rescue RestClient::ExceptionWithResponse => err
    ('Error: ' + err.to_s)
  end

  # response = RestClient.get('http://data.fixer.io/api/latest?access_key=229d1da7b736ef77d158ea0c224c4344&base=&symbols=USD,EUR,PLN,UAH')
  # puts response.singleton_methods.inspect #[:args, :args=, :body, :body=, :net_http_res, :net_http_res=, :code, :headers, :raw_headers, :cookies, :return!, :to_i, :description, :follow_redirection]
  # puts response
  #

  #   response_auth = RestClient::Request.execute(method: :post,
  #                                               url: 'http://localhost:8080/api/library/login',
  #                                               payload: {"username": 'defaultUser', "password": 'defaultPassword'}.to_json,
  #                                               headers: {content_type: 'application/json'},
  #                                               timeout: 10, open_timeout: 10)
  #
  #
  #
  #   puts response_auth.code
  #   # puts response_auth.headers
  #   headers = JSON.parse(response_auth.headers.to_json)
  #   puts headers["authorization"]
  #
  #   response_get_authors = RestClient::Request.execute(method: :get,
  #                                                      url: 'http://localhost:8080/api/library/authors?size=200',
  #                                                      # payload: {"username": 'defaultUser', "password": 'defaultPassword'}.to_json,
  #                                                      headers: {"authorization": headers["authorization"]},
  #                                                      timeout: 10, open_timeout: 10)
  #
  #   puts response_get_authors.code
  #   puts JSON.parse(response_get_authors.body)[-1]
  #   puts JSON.parse(response_get_authors.body)[-1]["authorId"]
  #
  #   # response_post_author = RestClient::Request.execute(method: :post,
  #   #                                                    url: 'http://localhost:8080/api/library/"author"',
  #   #                                                    payload: {"username": 'defaultUser', "password": 'defaultPassword'}.to_json,
  #   #                                                    headers: {"authorization": headers["authorization"]},
  #   #                                                    timeout: 10, open_timeout: 10)
  #
  #   response_get_author = RestClient::Request.execute(method: :get,
  #                                                     url: 'http://localhost:8080/api/library/author/96897',
  #                                                     # payload: {"username": 'defaultUser', "password": 'defaultPassword'}.to_json,
  #                                                     headers: {"authorization": headers["authorization"]},
  #                                                     timeout: 10, open_timeout: 10)
  # rescue RestClient::ExceptionWithResponse => err
  #   puts ("Error: " + err.to_s)
  #
  #   puts(response_get_author)
  #   # puts(response_get_author.code)
  #
end
