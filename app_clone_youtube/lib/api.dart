import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video_model.dart';

const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const KEY_YOUTUBE = "AIzaSyASegWRnGRRQ5KeWV2dsPEROjq7F4Iuk-I";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    String param = "search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$KEY_YOUTUBE"
        "&channelId=$ID_CANAL"
        "&q=$pesquisa";

    var url = Uri.https(
        URL_BASE,
        "search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$KEY_YOUTUBE"
        "&channelId=$ID_CANAL"
        "&q=$pesquisa");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      //print(dadosJson['items'][0]['snippet']['title'].toString());

      List<Video> videos = dadosJson['items'].map<Video>((map) {
        //return Video.fromJson(map);
        return Video.converterJson(map);
      }).toList();
      return videos;
      /*
      for (var video in dadosJson['itens']) {
        print("Resultado " + video.toString());
      }
      */

    } else {
      print("Deu ruim");
    }
  }
}
