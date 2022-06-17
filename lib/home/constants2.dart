// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class API {
//   static const String headersAgentId = "X-AGENT-ID";
//   static const String headersAgentToken = "X-AGENT-TOKEN";
//   static const String baseUrl =
//       "https://test815623.overseastopup.com/webappapi";
//
//   static const String postLogin = baseUrl + "/v1/login.html";
//   static const String postRegistration = baseUrl + "/v1/signup.html";
//   static const String postForgotPassword = baseUrl + "/v1/passwordReset.html";
//   static const String postEmailAvailable = baseUrl + "/v1/emailExists.html";
//   static const String postUsernameAvailable =
//       baseUrl + "/v1/usernameExists.html";
//   static const String getRefreshToken = baseUrl + "/v1/refreshToken.html";
//   static const String postOrderReview = baseUrl + "/v1/orderSummary.html";
//   static const String postOrderSummery = baseUrl + "/v1/executeOrder.html";
//   static const String postHelp = baseUrl + "/v1/helpForm.html";
//   static const String postCommissionEarned =
//       baseUrl + "/v1/transferCommissionsBalance.html";
//   static const String postValidateWalletPayment =
//       baseUrl + "/v1/validateWalletTopup.html";
//   static const String postWalletTopUP = baseUrl + "/v1/walletTopup.html";
//   static const String postEditProfile = baseUrl + "/v1/editProfile.html";
//
//   static const String getCountries = baseUrl + "/v1/countries.html";
//   static const String getBalance = baseUrl + "/v1/balance.html";
//   static const String getCategories = baseUrl + "/v1/categories.html";
//   static const String getOperators = baseUrl + "/v1/operators.html";
//   static const String getProducts = baseUrl + "/v1/products.html";
//   static const String getParseMSISDN = baseUrl + "/v1/parseMsisdn.html";
//   static const String getRecentTransactions =
//       baseUrl + "/v1/getOrdersList.html";
//   static const String getStatistics = baseUrl + "/v1/statistics.html";
//   static const String getPaymentMethods =
//       baseUrl + "/v1/walletTopupPaymentMethods.html";
//   static const String getDeleteAccount = baseUrl + "/v1/deleteAccount.html";
// }
//
// class InfoLinks {
//   static const String termsAndCondition =
//       "https://www.overseastopup.com/termsandconditions.html?app=true";
//   static const String privacyPolicy =
//       "https://www.overseastopup.com/privacypolicy.html?app=true";
// }
//
// class NomiWorldColors {
//   static const Color textColor = Color(0xFF6F859F);
//   static const Color primaryColor = Color(0xFF2B6DE2);
//   static const Color secondaryColor = Color(0xFF94ABD3);
//   static const Color errorColor = Color(0xFFD83A73);
//   static const Color barPresent = Color(0xFF7B61FF);
//   static const Color barPrevious = Color(0xFF94ABD3);
// }
//
// class SF {
//   static const String pin = "pin";
//   static const String agentId = "agentId";
//   static const String refreshToken = "refreshToken";
//   static const String accessToken = "accessToken";
// }
//
// TextStyle nomiWorldTextStyle = const TextStyle(
//   fontSize: 14,
//   fontWeight: FontWeight.w500,
//   color: NomiWorldColors.textColor,
// );
//
// TextStyle nomiWorldSubTextStyle = const TextStyle(
//   fontSize: 12,
//   fontWeight: FontWeight.w700,
//   color: NomiWorldColors.textColor,
// );
//
// String formatDate(DateTime dateTime) {
//   return "${DateFormat.yMMMMd('en_US').format(dateTime)} ${DateFormat.jm().format(dateTime)}";
// }
