import 'package:grocery_app/models/helpers/nav_model.dart';
import 'package:grocery_app/src/utils/images.dart';

mixin Constants {
  //Api responses
  static const API_SUCCESS = 'success';
  static const API_FAILURE = 'error';
  static const API_SESSION_EXPIRE = 'sessionExpire';
  static const INTERNET_ERROR = 'internetError';
  static const SUPABASE_URL = 'https://dccrgihucwbxscdoyhof.supabase.co';
  static const ANON_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3JnaWh1Y3dieHNjZG95aG9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0Njc2NzcsImV4cCI6MjAyODA0MzY3N30.javskma9oPUTZ6QRC6omBjp4XnewmYuWcKawMD8BsYA';
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
  static const CONTACT_US_THIRD = "Connect over here:";
  static const CONTACT_US_FOUR = "Let's Connect Professionally:";
  static const CONTACT_US_H2 = "Feedback and Collaboration";
  static const CONTACT_US_H2_TEXT =
      "We value your feedback and are always open to collaboration. If you have any suggestions to improve GrocWise or are interested in collaborating with us, please don't hesitate to reach out. Together, we can make grocery shopping smarter and more eDicient.";
  static const CONTACT_US_THANK = "Thank you for connecting with us!";

  static const DEFAULT_TEXT =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries";
  static const ABOUT_H1_TEXT =
      "Welcome to GrocWise, your smart grocery shopping assistant for Irish consumers and international students! GrocWise is designed to help you make informed decisions by providing comprehensive product data from all the major supermarkets in Ireland, including Tesco, Dunnes Stores, SuperValu, Lidle, and Aldi, as well as other supermarkets. With GrocWise, you can easily compare prices and find the best deals, ensuring you get the most value for your money.";
  static const ABOUT_H2 = "Why GrocWise?";

  static const ABOUT_H2_TEXT =
      "In today's fast-paced world, grocery shopping can be overwhelming, especially when prices for the same product vary across diHerent stores. GrocWise simplifies this process by consolidating product information from all major Irish supermarkets in one place. Whether you're a local resident or an international student trying to navigate the grocery landscape, GrocWise helps you save time and money by making smart, cost-eHective choices.";
  static const ABOUT_H3 = "Our Commitment to Guidelines and Standards";
  static const ABOUT_H3_TEXT =
      "At GrocWise, we prioritize accuracy, transparency, and user satisfaction. Our app is developed and maintained following all relevant guidelines and standards to ensure a seamless and reliable user experience. We adhere to data privacy regulations and strive to keep our platform secure, ensuring your personal information is protected at all times.";
  static const ABOUT_H4 = "Ethical Data Collection";
  static const ABOUT_H4_TEXT_1 =
      "We want to highlight that all data featured in GrocWise has been collected from supermarkets with strict adherence to the guidelines outlined on their websites. Our data collection practices are fully compliant with these guidelines, ensuring that no rules have been violated during the process. Moreover, we have meticulously followed all the rules of the General Data Protection Regulation (GDPR), as detailed ";
  static const ABOUT_H4_TEXT_2 = "here,";
  static const ABOUT_H4_TEXT_3 = " to protect your privacy and data security.";

  static const ABOUT_H5 = "Key Features:";
  static const ABOUT_H5_1 = "Comprehensive Product Data:";
  static const ABOUT_H5_2 = "Price Comparison:";
  static const ABOUT_H5_3 = "User-Friendly Interface:";
  static const ABOUT_H5_4 = "Regular Updates:";

  static const ABOUT_H5_1_TEXT =
      "Access detailed information on a wide range of products from Ireland's leading supermarkets.";
  static const ABOUT_H5_2_TEXT =
      "Compare prices across diHerent stores to find the best deals and save money on your grocery shopping.";
  static const ABOUT_H5_3_TEXT =
      "Enjoy a simple, intuitive app design that makes navigating through product listings and prices eHortless.";
  static const ABOUT_H5_4_TEXT =
      "Stay informed with the latest product information and price updates to ensure you always have the most current data.";

  static List<AboutModel> LIST_OF_H5 = [
    AboutModel(heading: ABOUT_H5_1, text: ABOUT_H5_1_TEXT),
    AboutModel(heading: ABOUT_H5_2, text: ABOUT_H5_2_TEXT),
    AboutModel(heading: ABOUT_H5_3, text: ABOUT_H5_3_TEXT),
    AboutModel(heading: ABOUT_H5_4, text: ABOUT_H5_4_TEXT),
  ];

  static const ABOUT_H6 = "Join the GrocWise Community";
  static const ABOUT_H6_TEXT =
      "We are committed to helping you make informed shopping decisions and enhance your grocery shopping experience. Join the GrocWise community today and start making smarter choices that benefit your wallet and lifestyle.";
  static const ABOUT_H7_TEXT =
      "Thank you for choosing GrocWise – your smart grocery shopping assistant!";

  static const CONTACT_MAIL = "imawaisshams@gmail.com";
  static const CONTACT_LINKEDIN = "https://www.linkedin.com/in/awais-shamas/";
  static const CONTACT_GITHUB = "https://github.com/Awais-shams";
  static const CONTACT_MEDIUM = "https://medium.com/@imawaisshams";
}

class AboutModel {
  final String heading;
  final String text;

  AboutModel({required this.heading, required this.text});
}
