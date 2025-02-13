class Api {
  static const String baseUrl =
      'https://untold-strapi.api.prod.loomi.com.br/api';
  static const firebaseToken = "5loiM6TbLAaAgPAqeLDDzzif30v2";
  static const String login = '$baseUrl/auth';
  static const String registerUser = '$baseUrl/auth/local/register';
  static const String movies = '$baseUrl/movies?populate=poster';
  static const String subtitles =
      '$baseUrl/subtitles?populate=file&filters%5Bmovie_id%5D=1';
  static const String likes = "$baseUrl/likes";
}
