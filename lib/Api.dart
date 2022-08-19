import 'package:flutter/cupertino.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const YOUTUBE_API_KEY = "Fake API Key";
const CHANNEL_ID = "UC95bEkaIgwhxSjSsdMFXYGg";

const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=50"
            "&order=date"
            "&key=$YOUTUBE_API_KEY"
            "&channelId=$CHANNEL_ID"
            "&q=$pesquisa"));
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    }
    return pesquisar("");
  }
}
