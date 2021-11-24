import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:github_user_repos/models/repos.dart';
import 'package:github_user_repos/utils/AppConstant.dart';
import 'package:http/http.dart' as http;

class ReposApiService {

  Future<List<Repos>?> getUserRepos(BuildContext context , String username) async {
    var url = Uri.parse(baseUrl + "$username/repos");
    print(url);
    var response = await http.get(url);
    try {
      if(response.statusCode == 200){
        var jsonResults = jsonDecode(response.body);
        if (jsonResults != null) {
          //parse the returned data into a list and return it..
          var jsonResultsList = jsonResults as List;
          print(jsonResultsList.toString());
          return jsonResultsList.map((repos) => Repos.fromJson(repos))
              .toList();
        }
      }
      if(response.statusCode == 404){
        // User Not Found
        return null;
      }

    } catch (e) {
      print("error + " + e.toString());
    }
  }



}
