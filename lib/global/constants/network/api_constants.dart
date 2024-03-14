import 'api_base_urls.dart';
import 'api_keys.dart';

class ApiConstants {
  ApiConstants._();

  ////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////
  
  // OpenAI API Key
  static const String apiKeyOpenAI = ApiKeys.openAI;

  // Replicate API Key
  static const String apiKeyReplicate = ApiKeys.replicate;

  // KeyEKMAN API Key
  static const String apiKeyEKMAN = ApiKeys.EKMAN;
  ////////////////////////////////////////////////////////////////
  // OpenAI API Base URL
  static const String apiBaseUrlOpenAI = ApiBaseUrls.openAI;

  // Replicate API Base URL
  static const String apiBaseUrlReplicate = ApiBaseUrls.replicate;

  ////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////
  //https://api.openai.com/v1/completions
  static const String urlGPT3 ='${ApiBaseUrls.https}${ApiBaseUrls.openAI}/${ApiBaseUrls.gpt3}';

  //https://api.replicate.com/v1/predictions
  static const String urlReplicate ='${ApiBaseUrls.https}${ApiBaseUrls.replicate}/${ApiBaseUrls.stableDiffusion}';


  //https://api.webflow.com/collections/642d828a7e0ce90b843e4238/items?live=true
  static String urlWebflow(String collection) => "${ApiBaseUrls.https}${ApiBaseUrls.webflow}/${ApiBaseUrls.webflowItemsCollectionLive(collection)}";

  // Webflow API Base URL
  //https://api.webflow.com/sites/642d82897e0ce9648d3e4195
  static String urlWebflowSite(String siteId) => "${ApiBaseUrls.https}${ApiBaseUrls.webflow}/${ApiBaseUrls.webflowSite(siteId)}";
  
  ////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////

  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "b4bc0b6e5e59012a84c6599f11266ed6";

  static const String nowPlaying = "movie/now_playing";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?$apiKey";

  ////////////////////////////////////////////////////////////////

  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  ///////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////

  /*static const String popular = "movie/popular";

  static const String topRated = "movie/top_rated";

  static const String upcoming = "movie/upcoming";

  static const String trending = "trending/movie/week";

  static const String discover = "discover/movie";

  static const String search = "search/movie";

  static const String movie = "movie";

  static const String tv = "tv";

  static const String person = "person";

  static const String collection = "collection";

  static const String company = "company";

  static const String keyword = "keyword";

  static const String list = "list";

  static const String discoverTv = "discover/tv";

  static const String searchTv = "search/tv";

  static const String trendingTv = "trending/tv/week";

  static const String popularTv = "tv/popular";

  static const String topRatedTv = "tv/top_rated";

  static const String onTheAirTv = "tv/on_the_air";

  static const String airingTodayTv = "tv/airing_today";

  static const String discoverPerson = "discover/person";

  static const String searchPerson = "search/person";

  static const String trendingPerson = "trending/person/week";

  static const String popularPerson = "person/popular";

  static const String latestPerson = "person/latest";

  static const String discoverCollection = "discover/collection";

  static const String searchCollection = "search/collection";

  static const String discoverCompany = "discover/company";

  static const String searchCompany = "search/company";

  static const String discoverKeyword = "discover/keyword";

  static const String searchKeyword = "search/keyword";

  static const String discoverList = "discover/list";

  static const String searchList = "search/list";

  static const String discoverMulti = "discover/multi";

  static const String searchMulti = "search/multi";

  static const String trendingMulti = "trending/all/week";

  static const String popularMulti = "multi/popular";

  static const String topRatedMulti = "multi/top_rated";

  static const String onTheAirMulti = "multi/on_the_air";

  static const String airingTodayMulti = "multi/airing_today";

  static const String language = "en-US";

  static const String page = "1";

  static const String include_adult = "false";

  static const String include_video = "false";

  static const String sort_by = "popularity.desc";

  static const String region = "US";

  static const String year = "2020";

  static const String primary_release_year = "2020";

  static const String with_genres = "28";

  static const String with_watch_monetization_types = "flatrate";

  static const String watch_region = "US";

  static const String with_watch_providers = "8";

  static const String with_original_language = "en";

  static const String with_companies = "420";

  static const String with_keywords = "suspense";

  static const String with_people = "500";

  static const String with_cast = "500";

  static const String with_crew = "500";

  static const String with_networks = "213";

  static const String with_runtime_gte = "80";

  static const String with_runtime_lte = "100";

  static const String with_release_type = "2|3";

  static const String first_air_date_year = "2020";

  static const String timezone = "America%2FNew_York";

  static const String air_date_gte = "2020-09-15";

  static const String air_date_lte = "2020-09-22";

  static const String first_air_date_gte = "2020-09-15";

  static const String first_air_date_lte = "2020-09-22";*/
}
