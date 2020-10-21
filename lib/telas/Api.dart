import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poutube/model/Video.dart';

const CHAVE_YOUTUBE_API="sua chave";
const ID_CANAL= "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE="https://www.googleapis.com/youtube/v3/";

class Api{
  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if(response.statusCode==200){

      Map<String,dynamic> dadosJason = json.decode(response.body);

      List<Video> videos = dadosJason["items"].map<Video>(
          (map){
            return Video.fromJason(map);
          }
      ).toList();

      return videos;


    }else{

    }
  }

}