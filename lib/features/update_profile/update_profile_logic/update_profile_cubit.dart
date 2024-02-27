
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/update_profile/update_profile_logic/update_profile_state.dart';






class ProfileUserCubit extends Cubit<ProfileUserProfileState> {


  ProfileUserCubit() : super(InitialProfileUserProfileState());


  static ProfileUserCubit get(context) => BlocProvider.of(context);

//
//
// void getProfile() async
// {
//   emit(GetProfileLoadingState());
//   await repoProfile.updateProfile(
//       UserProfile(
//     id: idUser
//   ))
//       .then((value)
//   {
//     profile = value.data![0].user;
//     print(' yooooooooo${profile!.imageProfile.toString()}');
//     print(value.data![0].user);
//
//   emit(GetProfileSuccessState());
//   }).catchError((error){
//     emit(GetProfileErrorState());
//   });
// }
//
//   void submitFormData({
//     required String name,
//     required String gender,
//      XFile? image,
//     required String email,
//
//   }) async {
//     var dio = Dio();
//
// // Create FormData
//     var formData = FormData();
//
// // Add text fields
//     formData.fields.addAll([
//       MapEntry('name', name),
//       MapEntry('email', email),
//       MapEntry('gender', gender),
//
//
//     ],
//
//
//     );
//
//
//     if (image != null) {
//       String filename = image!.path
//           .split('/')
//           .last;
//       formData.files.add(
//           MapEntry(
//             'image',
//             await MultipartFile.fromFile(
//                 image.path, filename: filename),
//           ));
//     }
//
//     print('wwwwwwwww$formData');
//     try {
//
//       var response = await dio.post(
//         'http://youin.life/api/public/api/auth/profile/update/$idUser',
//         data: formData,
//         options: Options(
//             followRedirects: false,
//             validateStatus:
//                 (status) => status != null && status < 400,
//             maxRedirects: 0,
//             headers: {
//               'Accept': '*/*',
//               'Content-Type': 'multipart/form-data',
//             }
//         ),
//
//       );
//
//       emit(UpdateProfileLoadingState());
//       print('yes');
//       if (response.statusCode == 200) {
//         emit(UpdateProfileSuccessState());
//         print("Success: ${response.data}");
//         showToast(text: 'تم تعديل الحساب بنجاح', state: ToastStates.success);
//       }
//     } catch (error) {
//       print('wwwwwwwww$formData');
//       emit(UpdateProfileErrorState());
//       showToast(text: 'لم يتم تعديل الحساب', state: ToastStates.success);
//
//       print("CatchError: $error");
//     }
//   }

}