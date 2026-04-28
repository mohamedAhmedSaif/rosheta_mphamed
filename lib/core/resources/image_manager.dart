class ImageManager {
  ImageManager._();
  static const String _baseurl = "images/assets";
  static const String _baseurlpng = "$_baseurl/png";
  static const String _baseurlsvg = "$_baseurl/svg";

  static String get logo => "$_baseurlpng/logo.png";
}