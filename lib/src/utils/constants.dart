import 'package:grocery_app/models/helpers/nav_model.dart';
import 'package:grocery_app/src/utils/images.dart';

mixin Constants {
  static const SPLASH_DELAY = Duration(milliseconds: 2000);
  //Bottom nav request codes
  static const HOME = 0;
  static const SHOPPING = 1;
  static const INFO = 2;
  static const PHONE = 3;

  static final List<NavModel> BOTTOM_NAV_ITEMS = [
    NavModel('Products', HOME, AppImages.HOME_SELECTED),
    NavModel('Product', SHOPPING, AppImages.SHOPPING_SELECTED),
    NavModel('About Us', INFO, AppImages.INFO_SELECTED),
    NavModel('Contact Us', PHONE, AppImages.PHONE_SELECTED),
  ];
}
