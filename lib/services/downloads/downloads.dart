
import 'dart:developer';

import 'package:netflix_with_tmdb/services/api_endpoints/api_end_points.dart';
import 'package:tmdb_api/tmdb_api.dart';

class DownloadService {
   getDownloads()async{
    final tmdb = TMDB(ApiKeys(ApiEndPoints.apiKey, ApiEndPoints.accessToken));
   final response = await tmdb.v3.trending.getTrending();
   log(response.toString());
   }
}