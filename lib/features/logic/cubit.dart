import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/features/logic/repo.dart';
import 'package:graduation_project/features/logic/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constant/const/const.dart';
import '../../core/constant/end_points/end_point.dart';
import '../../core/data_base/cache_helper/cache_helper.dart';
import '../../core/utils/toast.dart';
import '../ShoppingCar/shopping_car.dart';
import '../auth/models/login_model.dart';
import '../home_page/bottomnavItems/category_screens/category_screen.dart';
import '../home_page/bottomnavItems/favorite/favorite.dart';
import '../home_page/bottomnavItems/myProfile/my_profile.dart';


class AppCubit extends Cubit<AppStates> {
  Repository repo;
  AppCubit(this.repo) : super(InitialState());


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
String? roleLogin;

  postRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String role,
    required String password,
}) async
{
  emit(PostLoadingRegisterState());
  await repo.signUp(
    SignUpModelRequest(
       firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      password: password,
      passwordConfirm: password,
    )
  ).then((value) {
    roleLogin = value.data!.user!.role ;

    // phoneReg = value.user!.phoneNumber;
    // idReg = value.user!.id;
    // emailReg = value.user!.email;
    // dateReg = value.user!.created_at;
    // imageReg = value.user!.image;
    // nameReg = value.user!.name;
    //
    //
    CacheHelper.saveData(key: 'token', value: value.token);
    CacheHelper.saveData(key: 'roleLogin', value: roleLogin);
    CacheHelper.saveData(key: 'nameF', value: value.data!.user!.firstName);
    CacheHelper.saveData(key: 'nameL', value: value.data!.user!.lastName);
    CacheHelper.saveData(key: 'photo', value: value.data!.user!.file);
    CacheHelper.saveData(key: 'email', value: value.data!.user!.email);
    CacheHelper.saveData(key: 'userId', value: value.data!.user!.id);

    // CacheHelper.saveData(key: 'emailUser', value: emailReg);
    // CacheHelper.saveData(key: 'dateUser', value: dateReg);
    // CacheHelper.saveData(key: 'imageUser', value: imageReg);
    // CacheHelper.saveData(key: 'nameUser', value: nameReg);
    if(value.token != null) {
      showToast(text: 'تم انشاء الحساب بنجاح', state: ToastStates.success);

      emit(PostSuccessRegisterState());
      token = CacheHelper.getData(key: 'token');
      print(token);

      role = CacheHelper.getData(key: 'roleLogin');
      print(role);

      emailUser = CacheHelper.getData(key: 'email');
      photo = CacheHelper.getData(key: 'photo');
      nameF = CacheHelper.getData(key: 'nameF');
      nameL = CacheHelper.getData(key: 'nameL');
      userId = CacheHelper.getData(key: 'userId');
    }  else if (value.status == "fail"
    && value.data == null ){
    emit(PostErrorRegisterState());
    showToast(text: 'هذا البريد مستخدم من قبل', state: ToastStates.warning);

    }else {
    emit(PostErrorRegisterState());
    showToast(text: 'عذرا البيانات غير صحيحه', state: ToastStates.error);

    }
  }).catchError((onError)
  {
    showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

    emit(PostErrorRegisterState());
    debugPrint('errrrrror ${onError.toString()}');

  });

}


  postLogin({

    required String email,
    required String password,
  }) async
  {
    emit(PostLoadingLoginState());
    await repo.loginSales(
        LoginModelRequest(
          email: email,
          password: password
        )
    ).then((value) {
      if(value.token != null) {
        roleLogin = value.data!.user!.role ;


        CacheHelper.saveData(key: 'token', value: value.token);
        CacheHelper.saveData(key: 'roleLogin', value: roleLogin);
        CacheHelper.saveData(key: 'nameF', value: value.data!.user!.firstName);
        CacheHelper.saveData(key: 'nameL', value: value.data!.user!.lastName);
        CacheHelper.saveData(key: 'photo', value: value.data!.user!.file);
        CacheHelper.saveData(key: 'email', value: value.data!.user!.email);
        CacheHelper.saveData(key: 'userId', value: value.data!.user!.id);

        // phoneReg = value.user!.phoneNumber;
        // idReg = value.user!.id;
        // emailReg = value.user!.email;
        // dateReg = value.user!.created_at;
        // imageReg = value.user!.image;
        // nameReg = value.user!.name;


         showToast(text: 'تم تسجيل الدخول بنجاح', state: ToastStates.success);

        emit(PostSuccessLoginState());
        token = CacheHelper.getData(key: 'token');
        print(token);

        role = CacheHelper.getData(key: 'roleLogin');
        print(role);

        emailUser = CacheHelper.getData(key: 'email');
        photo = CacheHelper.getData(key: 'photo');
        nameF = CacheHelper.getData(key: 'nameF');
        nameL = CacheHelper.getData(key: 'nameL');
        userId = CacheHelper.getData(key: 'userId');
      } else if (value.status == "fail"
          || value.data == null ){
        emit(PostSuccessVerifyLoginState());
        showToast(text: 'عذرا البيانات غير صحيحه', state: ToastStates.warning);

      }else {
        emit(PostErrorLoginState());
        showToast(text: 'عذرا البيانات غير صحيحه', state: ToastStates.error);

      }
    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(PostErrorLoginState());
      debugPrint('errrrrror ${onError.toString()}');

    });

  }


  DataUpdateProfile? updateData ;
  updateMeFun() async
  {
    emit(GetLoadingUpdateMeState());
    await repo.updateMe().then((value) {
      if(value.status == "success") {

updateData = value.data;

        emit(GetSuccessUpdateMeState());
CacheHelper.saveData(key: 'nameF', value: value.data!.data!.firstName);
CacheHelper.saveData(key: 'nameL', value: value.data!.data!.lastName);
CacheHelper.saveData(key: 'photo', value: value.data!.data!.file);
CacheHelper.saveData(key: 'email', value: value.data!.data!.email);

emailUser = CacheHelper.getData(key: 'email');
photo = CacheHelper.getData(key: 'photo');
nameF = CacheHelper.getData(key: 'nameF');
nameL = CacheHelper.getData(key: 'nameL');
      }else {
        emit(GetErrorUpdateMeState());
        showToast(text: 'عذرا حدث خطأ', state: ToastStates.error);

      }
    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(GetErrorUpdateMeState());
      debugPrint('errrrrror ${onError.toString()}');

    });

  }

  DataAllUsers? allUsers ;
  AllUsersFun() async
  {
    emit(GetLoadingAllUsersState());
    await repo.AllUsers().then((value) {
      if(value.status == "success") {
        allUsers = value.data;

        emit(GetSuccessAllUsersState());

      }else {
        emit(GetErrorAllUsersState());
        showToast(text: 'عذرا حدث خطأ', state: ToastStates.error);

      }
    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(GetErrorAllUsersState());
      debugPrint('errrrrror ${onError.toString()}');

    });

  }

  deleteUsersFun({required userId}) async
  {
    emit(DeleteLoadingUsersState());
    await repo.deleteUsers(userId).then((value) {

      emit(DeleteSuccessUsersState());
      showToast(text: 'تم الحذف بنجاح', state: ToastStates.success);


    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(DeleteErrorUsersState());
      debugPrint('errrrrror ${onError.toString()}');

    });

  }

  Future<void> updateUserProfile({
    required String firstName,
    required String lastName,
    required String email,

    File? image,
  }) async {
    const String url = 'https://shopping-gp-2b5338c8c372.herokuapp.com/users/updateMe';

    Dio dio = Dio();


    var formData = FormData();
    formData.fields.addAll([
      MapEntry('firstName', firstName),
      MapEntry('lastName', lastName),
      MapEntry('email', email),


    ],


    );

    if (image != null) {
      String filename = image.path
          .split('/')
          .last;
      formData.files.add(
          MapEntry(
            'photo',
            await MultipartFile.fromFile(
                image.path, filename: filename),
          ));
    }


    try {
      final response = await dio.patch(
        url,
        data: formData,

          options: Options(
              followRedirects: true,
              validateStatus:
                  (status) => status != null && status < 500,
              maxRedirects: 0,
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': '*/*',
                'Content-Type': 'multipart/form-data',
              }

          ),

      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
          showToast(text: 'تم التعديل بنجاح', state: ToastStates.success);
emit(EditSuccessAllUsersState());
          CacheHelper.saveData(key: 'nameF', value: response.data!.user!.firstName);
        CacheHelper.saveData(key: 'nameL', value: response.data!.user!.lastName);
        CacheHelper.saveData(key: 'photo', value: response.data!.user!.file);
        CacheHelper.saveData(key: 'email', value: response.data!.user!.email);

        emailUser = CacheHelper.getData(key: 'email');
        photo = CacheHelper.getData(key: 'photo');
        nameF = CacheHelper.getData(key: 'nameF');
        nameL = CacheHelper.getData(key: 'nameL');
      } else {
        print('Failed to update profile');
        showToast(text: 'حدث خطأ حاول مرة اخرى', state: ToastStates.error);

      }
    } catch (e) {
      print('Error updating profile: $e');
     // showToast(text: 'حدث خطأ حاول مرة اخرى', state: ToastStates.error);

    }
  }

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
     CategoryScreen(),
    // ShoppingCar(reverse: false,),
     MyProfile(isReverse: false,),


  ];




  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());

  }


}