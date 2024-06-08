mixin AppImages {
  static const String _basePath = 'assets/images';
  //static const String APP_LOGO = "$_basePath/app_icon.png";
  //static const String APP_LOGO_COLORED = "$_basePath/app_icon_colored.png";
  static const String HOME_SELECTED = "$_basePath/home_selected.svg";

  static const String INFO_SELECTED = "$_basePath/info_selected.svg";

  static const String SHOPPING_SELECTED = "$_basePath/shopping_selected.svg";

  static const String PHONE_SELECTED = "$_basePath/phone_selected.svg";

  static const String DUMMY_PRODUCT = "$_basePath/dummy_product.svg";

  static const String LOADING_GIF = "$_basePath/loading.gif";

  static String getDummyImage() => DUMMY_PRODUCT;
}
