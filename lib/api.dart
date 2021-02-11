import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import "package:http/http.dart" as http;

const API_KEY = "AIzaSyAFIBL3N_HWSYkWUIjINIusZP285yMP8fE";

class Api{
  search(String search)async{
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
    );

    decode(response);
  }

  decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);
      List<Video> videos = decoded["items"].map(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

    }
  }
}



//"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
//"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
//"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"