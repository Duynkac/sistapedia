import 'package:sistapedia/contributions.dart';

class User {
  String username;
  String password;
  String displayName;
  int posts = 0;
  int followers = 0;
  int following = 0;
  String bio = "";
  Contributions contributions;

  User(String username, String password) {
    this.username = username;
    this.password = password;
    this.displayName = username;
    contributions = new Contributions();
  }

  String getUsername() {
    return username;
  }

  setPosts(int posts) {
    this.posts = posts;
  }

  setFollowers(int followers) {
    this.followers = followers;
  }

  setFollowing(int following) {
    this.following = following;
  }

  setBio(String bio) {
    this.bio = bio;
  }

  setDisplayname(String displayName) {
    this.displayName = displayName;
  }
}
