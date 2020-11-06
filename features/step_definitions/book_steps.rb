require_relative (Dir.getwd + '/restapi/service/author_service.rb')
require_relative (Dir.getwd + '/restapi/service/genre_service.rb')
require_relative (Dir.getwd + '/restapi/service/book_service.rb')

author_service = Author_service.new
author_id_existing = 0
genre_service = Genre_service.new
genre_id_existing = 0
book_service = Book_service.new
book_id_to_be_saved = 0

Given('I have to log in and get the token to proceed with books') do
  # response_on_auth = authentication_service.get_token()
  # # expect(response_on_auth.code).to eql(200)
  # token = JSON.parse(response_on_auth.headers.to_json)['authorization']
end

When('I get the list of existing books and generate the id that does not exist') do
  response_all_books = book_service.get_all_books(@token)
  # expect(response_all_books.code).to eql(200)
  book_id_to_be_saved = JSON.parse(response_all_books.body)[-1]['bookId'] + 1
end

When('I get the lists of existing authors and genres to get the id of existing author and genre') do
  response_all_authors = author_service.get_all_authors(@token)
  author_id_existing = JSON.parse(response_all_authors.body)[-1]['authorId']
  response_all_genres = genre_service.get_all_genres(@token)
  genre_id_existing = JSON.parse(response_all_genres.body)[-1]['genreId']
end

Then('I should save a new book with non-existing book id and check whether it was saved successfully') do
  book_service.book_model['bookId'] = book_id_to_be_saved
  resp_on_save_book = book_service.save_book(author_id_existing, genre_id_existing, book_service.book_model, @token)
  expect(resp_on_save_book.code).to eql(201)
  expect(resp_on_save_book.body).to eql(book_service.book_model.to_json)
end

Then('I should deleted the saved book and check whether it was deleted successfully') do
  response_on_delete = book_service.delete_book(book_id_to_be_saved, @token)
  expect(response_on_delete.code).to eql(204)
  response_get_book = book_service.get_book(book_id_to_be_saved, @token)
  expect(response_get_book).to eql('Error: 404 Not Found')
end
