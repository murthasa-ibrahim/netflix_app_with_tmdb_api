class ApiEndPoints {
  static const accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiM2ZmZTg2YzY0MWJiN2VhY2Y2N2JmYmYyZTNjZDhmMCIsInN1YiI6IjYyYjU0ODEwYjc3ZDRiMDA1MmFjY2U2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.scPLq8OtwHYW5u3IxXraIqNo5fKNTodmgfEHNQxkJkA";
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const trending = "trending/all/day";
 static Map endPoints = {
    "Up Coming": "movie/upcoming",
    "Top Rated": "movie/top_rated",
    "Popular": "movie/popular",
    "Now Playing": "movie/now_playing",
    "Latest": "movie/latest",
  };
}
