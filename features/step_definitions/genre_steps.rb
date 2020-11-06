require_relative (Dir.getwd + '/restapi/service/genre_service.rb')

genre_service = Genre_service.new
genre_id_to_be_saved = 0

Given('I have to log in and get the token to proceed with genres') do
  # response_on_auth = authentication_service.get_token()
  # # expect(response_on_auth.code).to eql(200)
  # token = JSON.parse(response_on_auth.headers.to_json)['authorization']
end

When('I get the list of existing genres and generate the id that does not exist') do
  response_all_genres = genre_service.get_all_genres(@token)
  # expect(response_all_genres.code).to eql(200)
  genre_id_to_be_saved = JSON.parse(response_all_genres.body)[-1]['genreId'] + 1
end

Then('I should save a new genre with non-existing id and check whether it was saved successfully') do
  genre_service.genre_model['genreId'] = genre_id_to_be_saved
  resp_on_save_genre = genre_service.save_genre(genre_service.genre_model, @token)
  expect(resp_on_save_genre.code).to eql(201)
  expect(resp_on_save_genre.body).to eql(genre_service.genre_model.to_json)
end

Then('I should deleted the saved genre and check whether it was deleted successfully') do
  response_on_delete = genre_service.delete_genre(genre_id_to_be_saved, @token)
  expect(response_on_delete.code).to eql(204)
  response_get_genre = genre_service.get_genre(genre_id_to_be_saved, @token)
  expect(response_get_genre).to eql('Error: 404 Not Found')
end