import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user_repos/controllers/repos_controller.dart';
import 'package:github_user_repos/screens/repositories_list_screen.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/utils/AppConstant.dart';
import 'package:github_user_repos/widgets/app_button.dart';
import 'package:github_user_repos/widgets/loading_animation.dart';
import 'package:github_user_repos/widgets/text.dart';
import 'package:github_user_repos/widgets/text_field.dart';
import 'package:nb_utils/nb_utils.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {

  TextEditingController usernameController = TextEditingController();
  final reposController = Get.put(ReposController());

  // This screen presents a list of all the repositories

  //this screen provide the user with a text field in which the user will enter the username of any Github account.
  //then

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: text("Search Repos" , textColor: secondaryTextColor, isBold: true, fontSize: textSizeLargeMedium, ),
        backgroundColor: primaryBackgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text field label
            text("Enter your Github username" , fontSize: textSizeLargeMedium, ),
            10.height,
            // text field
            textField(hint: "Username", controller: usernameController,
              keyboardType: TextInputType.name, width: width * 0.7,),
            10.height,
            // the search button (as long as there's an api call, the button is hidden and an animation widget will be present)
            // to prevent the user from clicking more than one time, hence, calling the api more than once at a time.
            // this button calls the getUserRepos() method in the controller and when the request is successfully returned
            // we navigate to the RepositoriesListScreen to represent them
            Obx( () => (reposController.isLoading.value)
                ? LoadingAnimation()
                : appButton("Search", (){
                  if(usernameController.text.isEmpty){
                    snackBar(context , title: "Please enter a name!");
                  }else{
                    reposController.getUserRepos(context, usernameController.text ).then((value) {
                      if(value != null){
                        Navigator.push(context, MaterialPageRoute(builder: (c) => RepositoriesListScreen(usernameController.text) ));
                      }else{
                        snackBar(context , title: "Username is not found");
                      }
                    });
                  }
              } , btnWidth: width * 0.5,),
            ),
          ],
        ),
      ),
    );
  }
}


