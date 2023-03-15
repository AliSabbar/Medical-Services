class EndPoints {
  // ! BASE URL
  static String baseUrl = "https://medical-services.onrender.com/";
  //! TOKEN
  static String? token;
  // ? AUTH END POINTS
  static String signUp = "admin/auth/signup/";
  static String signIn = "admin/auth/signin/";
  static String otp = "admin/auth/otp/";
  static String verifyOtp = "admin/auth/verifyOTP/";
  static String forgetPassword = "admin/auth/forgetPassword";
  // ? SPECIALTY
  static String getAllSpecialty = "admin/Specialties/?size=10";
  //? USER
  static String getUserById = "admin/user/";
  static String updateUserProfile = "admin/user/";
  static String getAllDoctorsSP = "admin/dr/getAllDrSameSpec?size=10";
  static String addDoctorToFav = "admin/user/addFavorite/";
  static String removeDoctorFromFav = "admin/user/removeFavorite/";
  //? DOCTOR
  static String getDoctorById = "admin/dr/";
}
