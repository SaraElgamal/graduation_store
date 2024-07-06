import 'package:mime/mime.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/const/const.dart';
import 'package:graduation_project/features/auth/models/login_model.dart';
import 'package:graduation_project/features/home_page/Products/logic/states.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/end_points/end_point.dart';
import '../../../../core/utils/toast.dart';
import '../../../../styles/styles.dart';
import '../../../admin/create_products/add_details.dart';
import '../../../logic/repo.dart';

class ProductsCubit extends Cubit<ProductStates> {
  Repository repo;
  ProductsCubit(this.repo) : super(InitialStateProduct());


  static ProductsCubit get(context) => BlocProvider.of(context);

  createProductFun(context,{
    required String name,
    required String category,
    required String price,
    required String brand,
    required String discount,
    required String description,
    required String typeOfCloth,
    required String color,
    required String photoPath,
    required Map<String, int> sizes,
  }) async
  {
    emit(PostAddLoadingProduct());

    await repo.addProducts(
      CreateProductsRequest(
        name: name,
        category: category,
        price: price,
        brand: brand,
        discount: discount,
        description: description,
        typeOfCloth: typeOfCloth,

      )
    ).then((value) {


      if(value.status == "success") {
        showToast(text: 'تم إضافة المنتج بنجاح', state: ToastStates.success);

        emit(PostAddSuccessProduct());
        addDetailsRequest(
          productId: value.data!.data!.id.toString(),
          color: color,
          sizes: sizes,
          photoPath: photoPath,

        ).then((onValue){
          showDialog(context: context, builder: (context)
          => Dialog(
            child: Container(
              height: 200.h,
              width: 366.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text('هل تريد إضافة مزيد من التفاصيل لهذا المنتج؟',
                      textAlign: TextAlign.center,
                      style: Styles.style16SemiBold,),
                  ),
                  SizedBox(height: 40.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      defaultButtonSmall(context: context, text: 'إضافة المزيد', width: 100.w, height: 40.h,
                        textSize: 14.sp, toPage: ()
                        {
                          navigateTo(context, AddDetailsScreen(productId: value.data!.data!.id.toString()));

                        },                           ),
                      defaultButtonSmall(context: context, text: 'لاحقا', width: 100.w, height: 40.h,
                          textSize: 14.sp, toPage: ()
                          {
                            Navigator.pop(context);

                          }),
                    ],
                  ),
                ], ),
            ),
          ),);
        });
      }
      else {
        emit(PostAddErrorProduct());
        showToast(text: ' عذرا البيانات غير صحيحه ', state: ToastStates.error);

      }
    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      emit(PostAddErrorProduct());
      log('errrrrror ${onError.toString()}');
      log(token.toString());


    });

  }




  Future<void> addDetailsRequest({
    required String color,
    required String productId,
    required String photoPath,
    required Map<String, int> sizes,
  }) async {
    Dio dio = Dio();

    File imageFile = File(photoPath);

    // Get MIME type
    final mimeType = lookupMimeType(imageFile.path);
    print('MIME Type: $mimeType'); // Log MIME type
    print('File Path: ${imageFile.path}'); // Log file path

    MultipartFile photoFile = await MultipartFile.fromFile(
      imageFile.path,
      filename: imageFile.path.split('/').last,
         );

    List<Map<String, dynamic>> sizesList = sizes.entries.map((entry) {
      return {'size': entry.key, 'quantity': entry.value};
    }).toList();

    FormData formData = FormData.fromMap({
      'Product': productId,
      'color': color,
      'sizes': sizesList,
      'photo': photoFile,
    });

    try {
      Response response = await dio.post(
        'https://shopping-gp-2b5338c8c372.herokuapp.com/details',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => status != null && status < 500,
          maxRedirects: 0,
          headers: {
            'Authorization': 'Bearer $token',  // Ensure $token is correctly set
            'Accept': '*/*',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Response: ${response.data}');
        getAllProductsFun();
        showToast(text: 'تمت الاضافة', state: ToastStates.success);

      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

//   Future<void> addDetailsRequest({
//     required String color,
//     required String productId,
//     required String photoPath,
//     required Map<String, int> sizes,
//   }) async {
//     Dio dio = Dio();
//
//
//     File imageFile = File(photoPath);
//
//     final mimeType = lookupMimeType(imageFile.path);
//     print('MIME Type: $mimeType'); // Log MIME type
//     print('File Path: ${imageFile.path}'); // Log file path
//
//     MultipartFile photoFile = await MultipartFile.fromFile(
//       imageFile.path,
//       filename: imageFile.path.split('/').last,
//       contentType: MediaType.parse(mimeType!), // Ensure proper MIME type
//     );
//         // MultipartFile photoFile = await MultipartFile.fromFile(
//         //   imageFile.path, filename: imageFile.path.split('/').last);
//
//       Map<String, dynamic> formDataMap = {
//         'Product': productId,
//         'color': color,
//       };
//
//       int index = 0;
//       sizes.forEach((size, quantity) {
//         formDataMap['sizes[$index][size]'] = size;
//         formDataMap['sizes[$index][quantity]'] = quantity;
//         index++;
//       });
//
//       FormData formData = FormData.fromMap(formDataMap);
//       formData.files.add(MapEntry('photo', photoFile));
//
//       try {
//         Response response = await dio.post(
//           'http://10.0.2.2:4000/details',
//           data: formData,
//           options: Options(
//             followRedirects: false,
//             validateStatus: (status) => status != null && status < 500,
//             maxRedirects: 0,
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': '*/*',
//               'Content-Type': 'multipart/form-data',
//               'Accept-Encoding': 'gzip, deflate, br',
//               'Connection': 'keep-alive',
//               'Cookie': 'jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzczYWVlZDQ0M2E0NWZhNWRjYWU1YiIsImlhdCI6MTcxOTg2MDYwMywiZXhwIjoxNzIyNDUyNjAzfQ.eZTC67rt7bsdypkieHvItj6r0gn6hcJqN3BNuBPNVGE',
//             },
//           ),
//         );
// log(imageFile.path.split('/').last);
// log(imageFile.path);
//         if (response.statusCode == 201) {
//           print('Response: ${response.data}');
//         } else {
//           print('Error here: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Errrrrrrrrror: $e');
//       }
//
//
//   }

  List<DataAll>? allProducts = [];
  getAllProductsFun()async
  {
    emit(GetAllProductsLoadingProduct());
    await repo.getAllProducts(UserId(
userId: userId,
    )).then((value) {
      if(value.status == "success") {
        allProducts = value.data;

        emit(GetAllProductsSuccessProduct());

      }else {
        emit(GetAllProductsErrorProduct());
        showToast(text: 'عذرا حدث خطأ', state: ToastStates.error);

      }
    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(GetAllProductsErrorProduct());
      log('errrrrror ${onError.toString()}');

    });

  }

  deleteProductFun({required productId}) async
  {
    emit(DeleteProductsLoadingProduct());
    await repo.deleteProduct(productId).then((value) {

      emit(DeleteProductsSuccessProduct());
      showToast(text: 'تم الحذف بنجاح', state: ToastStates.success);

getAllProductsFun();
    }).catchError((onError)
    {
     // showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(DeleteProductsErrorProduct());
      log('errrrrror ${onError.toString()}');
      getAllProductsFun();

    });

  }

  deleteDetailsFun({required productId}) async
  {
    emit(DeleteDetailsLoadingProduct());
    await repo.deleteProduct(productId).then((value) {

      emit(DeleteDetailsSuccessProduct());
      showToast(text: 'تم الحذف بنجاح', state: ToastStates.success);


    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(DeleteDetailsErrorProduct());
      log('errrrrror ${onError.toString()}');

    });

  }


  addInFavFun({
    required String productId,
  }) async {
    emit(PostLoadingFavState());
    await repo
        .addToFav(

        productId,
    )
        .then((value) {

      if (value.status == "success") {
        showToast(
            text: 'تم إضافة المنتج إلى المفضلة',
            state: ToastStates.success);

        emit(PostSuccessFavState());
getAllProductsFun();

      } else if (value.status == "fail") {
        showToast(
            text: value.message.toString(),
            state: ToastStates.white);

        emit(PostErrorFavState());
      }
    }).catchError((onError) {

      showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      emit(PostErrorFavState());
      log('errrrrror ${onError.toString()}');
    });
  }

  deleteFromFavFun({required productId}) async
  {
    emit(DeleteFavLoadingProduct());
    await repo.deleteFromFav(productId).then((value) {

      emit(DeleteFavSuccessProduct());
      showToast(text: 'تم الحذف بنجاح', state: ToastStates.success);
getFavFun();
      getAllProductsFun();

    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(DeleteFavErrorProduct());
      log('errrrrror ${onError.toString()}');

    });

  }

  deleteAllFavFun() async
  {
    emit(DeleteAllFavLoadingProduct());
    await repo.deleteAllFav().then((value) {

      emit(DeleteAllFavSuccessProduct());
      showToast(text: 'تم الحذف بنجاح', state: ToastStates.success);
      getFavFun();

    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(DeleteAllFavErrorProduct());
      log('errrrrror ${onError.toString()}');

    });

  }
  List<DataProductsDetails>? fav = [];
  getFavFun()async
  {
    emit(GetLoadingFavState());
    await repo.getFavorites().then((value) {
      if(value.status == "success") {
        fav = value.data!.data;

        emit(GetSuccessFavState());

      }else {
        emit(GetErrorFavState());
        showToast(text: 'عذرا حدث خطأ', state: ToastStates.error);

      }
    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ حاول مرة أخرى', state: ToastStates.error);

      emit(GetErrorFavState());
      log('errrrrror ${onError.toString()}');

    });

  }

}