require_relative ("base_service.rb")

class Author_service < Base_service

  def get_all_authors(token)
    api_client.get_request((@main_url + "authors?size=200"), {"authorization": token, accept: 'application/json'}, 10, 10)
  end

  def save_author(author_obj, token)
    api_client.post_request((@main_url + "author"), author_obj, {"authorization": token, content_type: 'application/json', accept: 'application/json'}, 10, 10)
  end

  def delete_author(author_id, token)
    api_client.delete_request((@main_url + "author/"), author_id, { 'authorization' => token }, 10, 10)
  end

  def get_author(author_id, token)
    complex_url = (@main_url + "author/" + author_id.to_s)
    api_client.get_request(complex_url, {"authorization": token, accept: 'application/json'}, 10, 10)
  end

end
