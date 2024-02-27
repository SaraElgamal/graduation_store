import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/features/logic/states.dart';

import '../../core/constant/const/const.dart';
import '../../core/data_base/cache_helper/cache_helper.dart';
import '../../core/utils/toast.dart';
import '../ShoppingCar/shopping_car.dart';
import '../auth/register/reg_model/reg_model.dart';
import '../home_page/bottomnavItems/category_screens/category_screen.dart';
import '../home_page/bottomnavItems/favorite/favorite.dart';
import '../home_page/bottomnavItems/home_screen.dart';
import '../home_page/bottomnavItems/myProfile/my_profile.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(InitialState());


  static AppCubit get(context) => BlocProvider.of(context);

  bool isArabicSelected = true;
  changeSelect(bool select)
  {
    isArabicSelected = select;
    emit(ChangeButtonState());
  }
String? phoneReg;
int? idReg;
String? emailReg;
String? imageReg;
String? dateReg;
String? nameReg;

//   postRegister({
//     required String name,
//     required String email,
//     required String phone,
//     required String password,
// }) async
// {
//   emit(PostLoadingRegisterState());
//   await repo.RegisterUser(User(
//     name: name,
//     email: email,
//     phoneNumber: phone,
//     password: password,
//   )).then((value) {
//     phoneReg = value.user!.phoneNumber;
//     idReg = value.user!.id;
//     emailReg = value.user!.email;
//     dateReg = value.user!.created_at;
//     imageReg = value.user!.image;
//     nameReg = value.user!.name;
//
//
//     CacheHelper.saveData(key: 'idUser', value: idReg);
//     CacheHelper.saveData(key: 'phoneUser', value: phoneReg);
//     CacheHelper.saveData(key: 'emailUser', value: emailReg);
//     CacheHelper.saveData(key: 'dateUser', value: dateReg);
//     CacheHelper.saveData(key: 'imageUser', value: imageReg);
//     CacheHelper.saveData(key: 'nameUser', value: nameReg);
//
//     showToast(text: 'تم انشاء الحساب بنجاح', state: ToastStates.success);
//
//     emit(PostSuccessRegisterState());
//
//   }).catchError((onError)
//   {
//     showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//     emit(PostErrorRegisterState());
//     debugPrint('errrrrror ${onError.toString()}');
//
//   });
//
// }
// // String? nameUser ;
// // String? emailUser ;
// // String? phoneUser ;
// // String? imageUser ;
// // String? date ;
// // int? idUser ;
//
//   postLogin({
//
//     required String phone,
//     required String password,
//   }) async
//   {
//     emit(PostLoadingLoginState());
//     await repo.LoginUser(User(
//
//       phoneNumber: phone,
//       password: password,
//     )).then((value) {
//       if(value.token != null) {
//         phoneReg = value.user!.phoneNumber;
//         idReg = value.user!.id;
//         emailReg = value.user!.email;
//         dateReg = value.user!.created_at;
//         imageReg = value.user!.image;
//         nameReg = value.user!.name;
//
//         CacheHelper.saveData(key: 'idUser', value: idReg);
//         CacheHelper.saveData(key: 'phoneUser', value: phoneReg);
//         CacheHelper.saveData(key: 'emailUser', value: emailReg);
//         CacheHelper.saveData(key: 'dateUser', value: dateReg);
//         CacheHelper.saveData(key: 'imageUser', value: imageReg);
//         CacheHelper.saveData(key: 'nameUser', value: nameReg);
//
//         idUser = CacheHelper.getData(key: 'idUser');
//         print(idUser);
//         nameUser = CacheHelper.getData(key: 'nameUser');
//         phoneUser = CacheHelper.getData(key: 'phoneUser');
//         emailUser = CacheHelper.getData(key: 'emailUser');
//         dateUser = CacheHelper.getData(key: 'dateUser');
//         imageUser = CacheHelper.getData(key: 'imageUser');
//         print(idUser);
//         print(nameUser);
//         print(phoneUser);
//         print(emailUser);
//         print(dateUser);
//         print(imageUser);
//
//         // CacheHelper.saveData(key: 'idUserLogin', value: idUser);
//         // CacheHelper.saveData(key: 'phoneUserLogin', value: phoneUser);
//         // CacheHelper.saveData(key: 'emailUserLogin', value: emailUser);
//         // CacheHelper.saveData(key: 'dateUserLogin', value: date);
//         // CacheHelper.saveData(key: 'imageUserLogin', value: imageUser);
//         // CacheHelper.saveData(key: 'nameUserLogin', value: nameUser);
//         //
//         showToast(text: 'تم تسجيل الدخول بنجاح', state: ToastStates.success);
//
//         emit(PostSuccessLoginState());
//
//       } else if (value.error != null && value.data == null && value.error != "Unauthorized"){
//         emit(PostSuccessVerifyLoginState());
//         showToast(text: value.error.toString(), state: ToastStates.warning);
//
//       }else {
//         emit(PostErrorLoginState());
//         showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//       }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);
//
//       emit(PostErrorLoginState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }
//
//   sendOTPUser(
//
//
//
//   ) async
//   {
//     emit(PostLoadingOTPState());
//     await repo.sendOTP(
//         User(
//
//       phoneNumber: phoneReg,
//
//     )).then((value) {
//       if(value.success != null) {
//        // showToast(text: 'تم ارسال ال otp بنجاح', state: ToastStates.success);
// print('تم ارسال ال otp بنجاح');
//         emit(PostSuccessOTPState());
//       } else if (value.error != null && value.error != "User not found"){
//         emit(PostErrorOTPState());
//         showToast(text: value.error.toString(), state: ToastStates.error);
//
//       }else {
//         emit(PostErrorOTPState());
//         showToast(text: 'عفوا حدث خطأ لا يوجد حساب لهذا الرقم', state: ToastStates.error);
//
//       }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);
//
//       emit(PostErrorOTPState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }
//
//   verifyPoneByOTP({
//
//     required String phone,
//     required String otp,
//
//   }) async
//   {
//     emit(PostLoadingVerifyState());
//     await repo.verifyPhone(
//         User(
//           phoneNumber: phone,
//           otp: otp,
//
//         )).then((value) {
//       if(value.message != null) {
//         showToast(text: 'تم التحقق وتسجيل الدخول بنجاح', state: ToastStates.success);
//
//         emit(PostSuccessVerifyState());
//
//       } else if (value.error != null ){
//         emit(PostErrorVerifyState());
//         showToast(text: value.error.toString(), state: ToastStates.error);
//
//       }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);
//
//       emit(PostErrorVerifyState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }
//
//   addFavourite({
//     required String productId,
//   }) async
//   {
//     emit(PostLoadingFavouriteState());
// print(productId);
//
// print(favProduct!.any((fav) => fav.id == productId ));
//     bool isProductInFav = false;
//     if (favProduct != null) {
//       for (int i = 0; i < favProduct!.length; i++) {
//
//         if (favProduct![i].product!.id.toString() == productId.toString()) {
//
//           isProductInFav = true;
//           break;
//         }
//       }
//     }
//     if (isProductInFav)
//     {
//       showToast(
//         text: 'هذا العنصر مضاف من قبل',
//         state: ToastStates.warning,
//       );
//       emit(PostWarningFavouriteState());
//
//     }else {
//       await repo.addFavourite(
//         AddFav(user_id: idUser.toString()),
//         productId: productId,
//
//       ).then((value) {
//         if(value.message != null) {
//
//           showToast(text: 'تم إضافة المنتج إلى المفضلة بنجاح', state: ToastStates.success);
//
//           emit(PostSuccessFavouriteState());
//           getFavourite();
//         }
//       }).catchError((onError)
//       {
//         showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//         emit(PostErrorFavouriteState());
//         debugPrint('errrrrror ${onError.toString()}');
//
//       });
//
//     }
//
//
//   }
// List<DataFavoriteGet>? favProduct = [];
//   getFavourite() async
//   {
//     emit(PostLoadingGetFavouriteState());
//     await repo.getAllFavourite(
//       AddFav(
//           user_id: idUser.toString()),
//
//     ).then((value) {
//       favProduct = value.data;
//      // if(value.message != null) {
//       //  showToast(text: 'تم إضافة المنتج إلى المفضلة بنجاح', state: ToastStates.success);
//
//         emit(PostSuccessGetFavouriteState());
//
//      // }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//       emit(PostErrorGetFavouriteState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }
//
//   deleteFavourite({
//     required String productId,
//   }) async
//   {
//     emit(PostLoadingDeleteFavouriteState());
//     await repo.deleteTheFavourite(
//       AddFav(user_id: idUser.toString()),
//       productId: productId,
//
//
//     ).then((value) {
//       if(value.message != null) {
//         showToast(text: value.message.toString(), state: ToastStates.success);
//
//         emit(PostSuccessDeleteFavouriteState());
//         getFavourite();
//       }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//       emit(PostErrorDeleteFavouriteState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }







  var suffixVerify = SvgPicture.asset(
    'assets/images/opennnn.svg',
    color: Colors.grey,
  );
  bool isPasswordVerify = true ;
  void suffixChangeVerify()
  {
    isPasswordVerify = ! isPasswordVerify;
    suffixVerify = isPasswordVerify ?
    SvgPicture.asset(
      'assets/images/opennnn.svg',
      color: Colors.grey,
    ) :
    SvgPicture.asset(
      'assets/images/eye.svg',
    ) ;
    emit(changeSuffixIconVerifyState());
  }
  var suffix = SvgPicture.asset(
    'assets/images/eye.svg',
  );
  bool isPassword = true;

  void suffixChange() {
    isPassword = !isPassword;
    suffix = isPassword ? SvgPicture.asset(
      'assets/images/eye.svg',
    ) : SvgPicture.asset(
      'assets/images/opennnn.svg',
      color: Colors.grey,
    );
    emit(changeSuffixIconState());
  }

  bool createPassword = false;

  createSuccess(successValidator) {
    createPassword = successValidator;
    emit(CreatePasswordState());
  }

  var suffixSign = SvgPicture.asset(
    'assets/images/opennnn.svg',
    color: Colors.grey,
  );
  bool isPasswordSign = true;

  void suffixChangeSign() {
    isPasswordSign = !isPasswordSign;
    suffixSign = isPasswordSign ? SvgPicture.asset(
      'assets/images/opennnn.svg',
      color: Colors.grey,
    ) : SvgPicture.asset(
      'assets/images/eye.svg',
    );
    emit(changeSuffixSignUpIconState());
  }
  int currentIndex = 1;


  List <Widget> screens =
  [

     FavoriteScreen(isReverse: false),
    const CategoryScreen(),
    const ShoppingCar(),
     MyProfile(isReverse: false,),




  ];


  // List <String> titles =
  // [
  //   'الرئيسية',
  //   'الشبكة الطبية',
  //   'الكارت الطبي',
  //   'التقديم',
  //
  // ];

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());

  }


}