mixin AppImages {
  static const String _basePath = 'assets/images';
  //static const String APP_LOGO = "$_basePath/app_icon.png";
  //static const String APP_LOGO_COLORED = "$_basePath/app_icon_colored.png";
  static const String HOME_SELECTED = "$_basePath/home_selected.svg";

  static const String INFO_SELECTED = "$_basePath/about_us.svg";

  static const String SHOPPING_SELECTED = "$_basePath/shopping_selected.svg";

  static const String PHONE_SELECTED = "$_basePath/user.svg";

  static const String DUMMY_PRODUCT =
      "https://digitalcontent.api.tesco.com/v2/media/ghs-mktg/b0b04216-fa73-466d-a9d7-c9fcfa1ce9b3/no-image.jpeg";

  static const String LOADING_GIF = "$_basePath/loading.gif";

  static String getDummyImage() => DUMMY_PRODUCT;
}
