require_relative(Dir.getwd + '/restapi/service/author_service.rb')

author_service = Author_service.new
author_id_to_be_saved = 0

Given('I have to log in and get the token to proceed with authors') do
  # response_on_auth = authentication_service.get_token()
  # # expect(response_on_auth.code).to eql(200)
  # token = JSON.parse(response_on_auth.headers.to_json)['authorization']
end

When('I get the list of existing authors and generate the id that does not exist') do
  response_all_authors = author_service.get_all_authors(@token)
  # expect(response_all_authors.code).to eql(200)
  author_id_to_be_saved = JSON.parse(response_all_authors.body)[-1]['authorId'] + 1
end

Then('I should save a new author with non-existing id and check whether it was saved successfully') do
  author_service.author_model['authorId'] = author_id_to_be_saved
  response_on_save_author = author_service.save_author(author_service.author_model, @token)
  expect(response_on_save_author.code).to eql(201)
  expect(response_on_save_author.body).to eql(author_service.author_model.to_json)
end

Then('I should deleted the saved author and check whether it was deleted successfully') do
  response_on_delete_author = author_service.delete_author(author_id_to_be_saved, @token)
  expect(response_on_delete_author.code).to eql(204)
  response_get_author = author_service.get_author(author_id_to_be_saved, @token)
  expect(response_get_author).to eql('Error: 404 Not Found')
end

# expect(response_on_delete.code).not_to eql( 204)