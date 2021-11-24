
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user_repos/api_services/repositories_api_services.dart';
import 'package:github_user_repos/models/repos.dart';

class ReposController extends GetxController {

  RxList<Repos?> userReposList = RxList<Repos>();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // this method gets called from the UI and calls the services Class
  // It puts the returned list in a RXList() "which basically means a list that we can listen to if there is any change happened"
  // and change the UI according to that change
  // fortunately, the Getx Library does that for us
  Future<List<Repos>?> getUserRepos(BuildContext context , String username ) async {
    try {
      isLoading(true);
      var reposList = await ReposApiService().getUserRepos(context, username );
      userReposList(reposList);
      update();
      return reposList;
    }
    finally {
      isLoading(false);
    }
  }

}
