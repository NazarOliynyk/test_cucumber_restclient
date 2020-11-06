require_relative ("base_service.rb")

class Book_service < Base_service

  def get_all_books(token)
    api_client.get_request((@main_url + "books?size=200"), {"authorization": token, accept: 'application/json'}, 10, 10)
  end

  def save_book(author_id, genre_id, book_obj, token)
    complex_url = (@main_url + "book/" + author_id.to_s + "/" + genre_id.to_s)
    api_client.post_request(complex_url, book_obj, {"authorization": token, content_type: 'application/json', accept: 'application/json'},10,10)
  end

  def delete_book(book_id, token)
    api_client.delete_request((@main_url + "book/"), book_id, {'authorization' => token}, 10, 10)
  end

  def get_book(book_id, token)
    complex_url = (@main_url +  "book/" + book_id.to_s)
    api_client.get_request(complex_url, {"authorization": token, accept: 'application/json'}, 10, 10)
  end

end
