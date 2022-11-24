
class AppConstant{


static const String baseUrl ="http://mvs.bslmeiyu.com";
static const String getProductEndPoint="/api/v1/products/popular";
static const String getRecommendedEndPoint ="/api/v1/products/recommended";
static const String token="DBtoken";
String getImageUrl(String image ) => "${baseUrl}/uploads/${image}";





}