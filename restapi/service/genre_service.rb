require_relative ("base_service.rb")

class Genre_service < Base_service

  def get_all_genres(token)
    api_client.get_request((@main_url + "genres?size=200"), {"authorization": token, accept: 'application/json'}, 10, 10)
  end

  def save_genre(genre_obj, token)
    api_client.post_request((@main_url + "genre"), genre_obj, {"authorization": token, content_type: 'application/json', accept: 'application/json'},10,10)
  end

  def delete_genre(genre_id, token)
    api_client.delete_request((@main_url + "genre/"), genre_id, { 'authorization' => token }, 10, 10)
  end

  def get_genre(genre_id, token)
    complex_url = (@main_url + "genre/") + genre_id.to_s
    api_client.get_request(complex_url, {"authorization": token, accept: 'application/json'}, 10, 10)
  end

end
