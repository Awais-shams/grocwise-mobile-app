import 'package:grocery_app/models/helpers/nav_model.dart';
import 'package:grocery_app/src/utils/images.dart';

mixin Constants {
  //Api responses
  static const API_SUCCESS = 'success';
  static const API_FAILURE = 'error';
  static const API_SESSION_EXPIRE = 'sessionExpire';
  static const INTERNET_ERROR = 'internetError';
  static const SENTRY_DNS =
      'https://b726b769c3b7bf7dc04d8d1808153ff2@o4504396355272704.ingest.sentry.io/4505917394649088';
  static const DEFAULT_IMAGE =
      "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSYj-vikGnJNyxtRFw3wG7J6fdo43Wfs8J196yHIukwqfj24W3m";

  static const SPLASH_DELAY = Duration(milliseconds: 2000);
  //Bottom nav request codes
  static const HOME = 0;
  static const INFO = 1;
  static const PHONE = 2;

  static final List<NavModel> BOTTOM_NAV_ITEMS = [
    NavModel('Products', HOME, AppImages.HOME_SELECTED),
    NavModel('About Us', INFO, AppImages.INFO_SELECTED),
    NavModel('Contact Us', PHONE, AppImages.PHONE_SELECTED),
  ];
  static const CONTACT_US_HEADING = "We have been expecting you here.";
  static const CONTACT_US_SECOND = "Let’s do it together";
  static const CONTACT_US_THIRD = "Connect over here";
  static const DEFAULT_TEXT =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries";
}
