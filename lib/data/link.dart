abstract class LinksUrl {
  static const baseUrl = "http://quizzy-001-site1.atempurl.com/";

  static const registerUrl = "/api/Auth/student-register";
  static const confirmEmail = "/api/Auth/confirm-email";
  static const reSendCode = "/api/Auth/resend-verfication-code";
  static const logIn = "/api/Auth/LogIn";
  static const sendResetPasswordCode = "/api/Auth/send-reset-passwordCode";
  static const reSetPassword = "/api/Auth/reset-password";
  static const changepassword = "/api/Auth/change-password";
  static const getTeacherClasses = "/api/Class/get-teacher-classes";
  static const getStudentsClass = "/api/Class/get-students/";
  static const getProfileTeacherr = "/api/Auth/get-teacher-profile";
  static const accepteStudent = "/api/Class/post-accept-student";
  static const deleteStudent = "/api/Class/post-delete-student/";
  static const addQuiz = "/api/Exam";

  static const refreshToken = "/api/Auth/refresh-token";

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
