import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user_repos/controllers/repos_controller.dart';
import 'package:github_user_repos/screens/web_view_screen.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/widgets/repositoty_list_item.dart';
import 'package:github_user_repos/widgets/text.dart';
import 'package:nb_utils/nb_utils.dart';

class RepositoriesListScreen extends StatefulWidget {
  String username;

  RepositoriesListScreen(this.username);

  @override
  _RepositoriesListScreenState createState() => _RepositoriesListScreenState();
}

class _RepositoriesListScreenState extends State<RepositoriesListScreen> {
  final reposController = Get.put(ReposController());
  String mode = "list";

  // this page gets opened only when there is a successful call to getUserRepos() method in ReposController() Controller Class.
  // so we know for sure that there's a list of Repos is waiting to be shown on the screen.
  // we don't have to call anything in here.. Just representing the data in the list

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: text(
          "${widget.username}'s Repositories",
          textColor: secondaryTextColor,
        ),
        backgroundColor: primaryBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                // change the mode of the list ( Linear list or Grid List )
                onTap: () {
                  setState(() {
                    if (mode == "list")
                      mode = "grid";
                    else
                      mode = "list";
                  });
                },
                child: Icon(
                  (mode == "list") ? Icons.grid_view : Icons.list_sharp,
                  size: 30,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // the User Image
            // todo: When he clicks on the image, open his/her profile page
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => WebViewScreen(
                            reposController.userReposList[0]!.owner!.htmlUrl!,
                            "${widget.username}'s Profile")));
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  reposController.userReposList[0]!.owner!.avatarUrl!,
                ),
              ),
            ),
          ),
        ],
      ),
      body: (mode == "list")
          // if true , show the linear list
          //if false, show the grid list
          // using separated listView to be able to divide the items with a line (Divider())
          ? ListView.separated(
              itemCount: reposController.userReposList.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              separatorBuilder: (context, index) {
                return Divider(
                  color: greyColor,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return RepositoryItem(
                    reposController.userReposList[index], mode);
              },
            )
          : SingleChildScrollView(
              child: Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.spaceEvenly,
                children: List.generate(
                  reposController.userReposList.length,
                  (index) {
                    return Card(
                      child: Container(
                        width: width * 0.45,
                        margin: EdgeInsets.all(2),
                        child: RepositoryItem(
                            reposController.userReposList[index], mode),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
