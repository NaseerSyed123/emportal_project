// import 'package:digital_clinic/view/screens/LogIn/SurveyManager.dart';
// import 'package:digital_clinic/view/screens/clinic_list/ClinicListManager.dart';
// import 'package:digital_clinic/view/screens/doctor_list/CustomMarkerListManager.dart';
// import 'package:digital_clinic/view/screens/doctor_login/doctor_signin.dart';

// import '../view/screens/clinic_list/ClinicListManager.dart';
// import '../view/screens/doctor_list/CustomMarkerListManager.dart';
// import '../view/screens/doctor_login/LoginManager.dart';
// import '../view/screens/doctor_register/doctor_register_manager.dart';

import 'package:emportal_project/view/screens/survey/SurveyManager.dart';
import 'package:emportal_project/view/screens/survey/SurveyModel.dart';
import 'package:emportal_project/view/screens/walkaround/WalkaroundManager.dart';
import 'package:emportal_project/view/screens/Login/UserManager.dart';


class Overseer {
  Map<dynamic, dynamic> repository = {};

  ///
  //
  static List<SurveyModel> surveyList = List.empty() ;
  static bool isLogout = false;
  static int successLogin = 0;
  static String successLogin_msg = "";
  static bool isFromLogoutFlow = false;
  static String csrf_token_overseer = "";
  static String user_image_path = "";
  static String home_text = "";
  static String home_text_2nd = "";
  static String course_image_path = "";
  static String base_URL = "";
  static String login_status = "";
  static String register_status = "";
  static String videoURL = "";
  static String MainvideoURL = "";
  static String userName = "";
  static String videoCaption = "";
  static String fitnesgoal_name = "";
  static String gender = "";
  static String heightin = "";
  static String weighttin = "";
  static String createUserActivityMessage = "";
  static String signInActivityMessage = "";
  static String scheduleQuery = "";
  static int weight = 0;
  static int height = 0;
  static int userId = 0;
  static int onGoingCoursesLength = 0;
  static int fitnesgoal_id = 0;
  static String freeTrialMessage = "";
  static bool freeTrialEnable = false;
  static bool is_user_valid = false;
  static bool is_user_Registered = false;
  static bool is_Profile_updated = false;
  static bool isColor = false;
  static bool isOngoingSuccess = false;

  // cart values

  Overseer() {
    // register managers
    register(UserManager, UserManager());
    register(WalkaroundManager, WalkaroundManager());
    register(SurveyManager, SurveyManager());
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    print("--- inside fetch");
    return repository[name];
  }
}
