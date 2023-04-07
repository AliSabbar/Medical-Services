class EndPoints {
  // ! BASE URL
  static String baseUrl = "https://medical-services1.onrender.com/";
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
  static String addToFav = "admin/user/addFavorite/";
  static String removeFromFav = "admin/user/removeFavorite/";
  static String getFav = "admin/user/getFav/";
  static String getDocTopRating = "admin/dr/getAllDrByRating";
  //? DOCTOR
  static String getDoctorById = "admin/dr/";
  //? CLINICS
  static String getClinicsNearMe = "admin/hf/getNearMe";
  static String getClinicTopRating = "admin/hf/getAllHfByRating";
  static String getAllClinics = "admin/hf/";
  static String getClinicById = "admin/hf/";

  // ? BOOKING
  static String getDocAppointment = "admin/booking/dr/";

}
