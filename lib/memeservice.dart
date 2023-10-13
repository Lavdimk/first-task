import 'dart:convert';

import 'package:http/http.dart' as http;
class MemeService {
  Future<List<Map<String, String>>> fetchMemes() async {
    final response = await http.get(Uri.parse('https://api.imgflip.com/get_memes'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final memesData = data['data']['memes'];
      
      final List<Map<String, String>> memesList = [];
      for (var meme in memesData) {
        final memeName = meme['name'];
        final memeUrl = meme['url'];
        memesList.add({
          'name': memeName,
          'url': memeUrl,
        });
      }
      
      return memesList;
    } else {
      throw Exception('Failed to fetch memes');
    }
      
  }
  
}