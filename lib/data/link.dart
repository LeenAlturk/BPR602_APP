abstract class LinksUrl {
  static const baseUrl = "http://cinemate-001-site1.jtempurl.com/";

  static const registerUrl = "/api/Auth/customer-register";
  static const confirmEmail = "/api/Auth/confirm-email";
  static const reSendCode = "/api/Auth/resend-verfication-code";
  static const logIn = "/api/Auth/LogIn";
  static const sendResetPasswordCode = "/api/Auth/send-reset-passwordCode";
  static const reSetPassword = "/api/Auth/reset-password";
  static const changepassword = "/api/Auth/change-password";
  static const imagepost = "/api/Image";
  // رابط الحذف باستخدام imageId
  static String deleteImage(int imageId) {
    return "api/Image/$imageId";  // هذا يضيف imageId في الرابط
  }
  
  static const refreshToken = "/api/Auth/refresh-token";
   static const movieType = "/api/MovieType";
   static const getmovies = "/api/Movie";
   static const getmoviesbyid = "/api/Movie";
  
   static const getsnacks = "/api/Snak";
  static const getAllclasses = "/api/Class/get-available-student-classes";
  static const getMyclasses = "/api/Class/get-student-classes";
  static const refreshreq = "/api/Auth/refresh-token";
  static const joinurl = "/api/Class/join-student";
  static const profileurl = "/api/Auth/get-student-profile";
  static const getMyexam = "/api/Exam/get-student-exams";
  static const getexamquestion = "/api/Exam/join-exam/";
  static const addAnswer = "/api/Exam/add-answers/";
  static const studentOnlineResult = "/api/Exam/get-student-total";
  static const resultDetailes = "/api/Exam/get-student-answers";
  static const studentresult = "/api/Exam/get-totals";
}
