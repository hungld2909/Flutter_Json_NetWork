import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'model.dart';
//! sẽ sử dụng cho gọi network call
//! để thực hiện các cuộc gọi mạng, bạn cần import http
class RestApiManager{
  Future<Albums> fetchItunesAlbums() async {
    //! khi chúng tôi thực hiện các cuộc gọi http, chúng tôi cần thực hiện các cuộc gọi không đồng bộ và sử dụng từ khóa future
    //! A Future is used to represent a potential value, or error, that will be available at some time in the future.
    var url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json";
    //Await the http get response, then decode the json - formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        final albums = albumsFromJson(response.body);
        print(albums);
        return albums;
    } else {
      print("Request failed with status: ${response.statusCode}");
      return null;
    }
  }
} 