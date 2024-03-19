class AssetConstant {
  static const imagePath = 'assets/images/';
  static const iconPath = 'assets/icons/';

  //----- icons
  static const homeIcon = '${iconPath}Home.svg';
  static const playIcon = '${iconPath}Icon.svg';
  static const profileIcon = '${iconPath}profile.svg';
  static const categorySelectLine = '${iconPath}Line 1.svg';
  static const forKIcon = '${iconPath}timer.svg';
  static const timer = '${iconPath}4k.svg';

  //----- images

  static const mainBanner = '${imagePath}banner02.png';

  static const poster01 = '${imagePath}banner03.jpg';
  static const poster02 = '${imagePath}banner04.jpg';
  static const poster03 = '${imagePath}banner05.jpg';
  static const poster04 = '${imagePath}banner06.jpg';
  static const poster05 = '${imagePath}banner07.jpg';
  static const poster06 = '${imagePath}banner08.jpg';
  static const poster07 = '${imagePath}banner09.jpg';
  static const castPlaceHolder =
      'https://largeshortfilms.com/wp-content/uploads/2022/10/default-placeholder-profile-icon-avatar-gray-man-90197957.jpg';

  //---- Movie Poster

  static List<String> moviePoster = [
    poster01,
    poster02,
    poster03,
    poster04,
    poster05,
    poster06,
    poster07,
  ];

  //---- Movie Categorys

  static List<String> movieCategory = [
    'Movie',
    'TV Series',
    'Documentary',
    'Sport'
  ];

  static String getGenreByIndex(int index) {
    switch (index) {
      case 28:
        return 'Action';
      case 12:
        return 'Adventure';
      case 16:
        return 'Animation';
      case 35:
        return 'Comedy';
      case 80:
        return 'Crime';
      case 99:
        return 'Documentary';
      case 18:
        return 'Drama';
      case 10751:
        return 'Family';
      case 14:
        return 'Fantasy';
      case 36:
        return 'History';
      case 27:
        return 'Horror';
      case 10402:
        return 'Music';
      case 9648:
        return 'Mystery';
      case 10749:
        return 'Romance';
      case 878:
        return 'Science Fiction';
      case 10770:
        return 'TV Movie';
      case 53:
        return 'Thriller';
      case 10752:
        return 'War';
      case 37:
        return 'Western';
      default:
        return 'None';
    }
  }
}
