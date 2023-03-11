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
   
}
