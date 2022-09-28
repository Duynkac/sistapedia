library sistapedia.data;

import 'package:sistapedia/user.dart';
import 'package:sistapedia/usercollection.dart';
import 'package:sistapedia/contribution.dart';
import 'package:sistapedia/contributions.dart';

bool isLoggedin = false;
User currentUser = new User(" ", "afksnlfnslfnslfn");
User currentAuthor = new User(" ", "sfskfhskfkshf");
Contribution currentArticle = new Contribution(" ");
UserCollection users = UserCollection();
Contributions articles = Contributions();
