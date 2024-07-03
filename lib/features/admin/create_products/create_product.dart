import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/admin/create_products/add_details.dart';
import 'package:graduation_project/features/home_page/Products/logic/cubit.dart';
import 'package:graduation_project/features/home_page/Products/logic/states.dart';
import 'package:graduation_project/styles/styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/components/components.dart';
import '../../../core/constant/const/const.dart';
import '../../../core/data_base/cache_helper/cache_helper.dart';
import 'package:intl/intl.dart';


class CreateProductScreen extends StatefulWidget {

  CreateProductScreen();

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {



  var nameProductCon = TextEditingController();
  var priceCon = TextEditingController();
  var discountCon = TextEditingController();
  var detailCon = TextEditingController();
  var brandCon = TextEditingController();
  var colorCon = TextEditingController();

  var typeCon = TextEditingController();

  var formAddTask = GlobalKey<FormState>();



  Map<String, int> _convertSizesToMap() {
    Map<String, int> sizeMap = {};
    for (var size in sizes) {
      if (size['size'] != null && size['quantity'] != null) {
        sizeMap[size['size']] = size['quantity'];
      }
    }
    return sizeMap;
  }
  List<String> categories = ['رجالى', 'حريمى', 'اطفالى'];
  String? selectedCategory;
  String? selectedType;
  List<String> types = [
    'T-shirts',
    'Blouses',
    'Shirts',
    'Sweaters',
    'Hoodies',
    'Jackets',
    'Coats',
    'Vests'
  ];
  List<String> availableSizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  String? _photoPath;
  final ImagePicker _picker = ImagePicker();

  List<Map<String, dynamic>> sizes = [];

  Future<void> _pickImage() async {
    final  pickedFile = await _picker.pickImage(source:
    ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _photoPath = pickedFile.path;
      }
    });
  }

  void _addSize() {
    setState(()
    {
      sizes.add({'size': null, 'quantity': 0});  // Initialize size with null and quantity with 0

    });
  }

  void _updateSize(int index, String size) {
    setState(() {
      sizes[index]['size'] = size;

    });
  }

  void _updateQuantity(int index, int quantity) {
    setState(()
    {
      sizes[index]['quantity'] = quantity;

    });
  }
  @override
  Widget build(BuildContext context) {
    var cubit = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit,ProductStates>(
      listener: (context, state) {
        if(state is PostAddSuccessProduct)
        {

        }
      },
      builder: (context, state) => Scaffold(
        appBar: appBarDefaultTheme(
            context: context, isReverse: true, title: 'إضافة منتج جديد'),
        body:

        Padding(
          padding:  EdgeInsets.symmetric(horizontal : 20.w),
          child: Form(
            key: formAddTask,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      SizedBox(height: 30.h,),



                      defaultTextFormFeild
                        (keyboardType: TextInputType.text,
                          controller: nameProductCon,
                          context,
                          validate: (value){
                            if (value == null || value == '') {
                              return 'لا تترك هذا الحقل فارغا';
                            }
                          }, label: 'اسم المنتج'),
                      SizedBox(height: 24.h),
                      defaultTextFormFeild
                        (keyboardType: TextInputType.number,

                          context,
                          controller: priceCon,
                          validate: (value)
                          {
                            if (value == null || value == '') {
                              return 'لا تترك هذا الحقل فارغا';
                            }
                          }, label: 'السعر'),

                      SizedBox(height: 24.h),
                      defaultTextFormFeild
                        (
                          context,
                          keyboardType: TextInputType.number,
                          controller: discountCon,
                          validate: (value){

if(value == null || value == '') {
  discountCon.text = "0" ;
}
                          }, label: 'الخصم بال %'),
                      SizedBox(height: 24.h),
                      defaultTextFormFeild
                        (
                          context,
                          keyboardType: TextInputType.text,
                          controller: brandCon,
                          validate: (value){

                            if (value == null || value == '') {
                              return 'لا تترك هذا الحقل فارغا';
                            }
                          }, label: 'الماركة'),
                      SizedBox(height: 24.h),
                      defaultTextFormFeild
                        (
                          context,
                          keyboardType: TextInputType.text,
                          controller: colorCon,
                          validate: (value){
                            if (value == null || value == '') {
                              return 'لا تترك هذا الحقل فارغا';
                            }

                          }, label: 'اللون'),
                      SizedBox(height: 10.h,),
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Row(
                          children: [
                            Icon(Icons.file_upload_outlined),
                            SizedBox(width: 5.w,),
                            Text('رفع صورة'),
                          ],
                        ),
                      ),
                      if (_photoPath != null) ...[
                        SizedBox(height: 10.h),
                        Image.file(File(_photoPath!)),
                      ],
                    // after this i want to make ui to choose size and quantity of this size to use them in the method below

                      SizedBox(height: 24.h),

                      DropdownButtonFormField<String>(
                        value: selectedCategory,
                        items: categories
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'التصنيف',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelStyle: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            color: primaryColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى اختيار التصنيف';
                          }
                          return null;
                        },
                      ),
                      //here
                      // defaultTextFormFeild
                      //   (
                      //     context,
                      //     keyboardType: TextInputType.phone,
                      //     controller: categoryCon,
                      //     validate: (value){
                      //
                      //
                      //     }, label: 'التصنيف'),


                      SizedBox(height: 24.h),
                      // defaultTextFormFeild
                      //   (
                      //     context,
                      //     keyboardType: TextInputType.phone,
                      //     controller: typeCon,
                      //     validate: (value){
                      //
                      //
                      //     }, label: 'النوع'),


                      DropdownButtonFormField<String>(
                        value: selectedType,
                        items: types
                            .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedType = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'النوع',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelStyle: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            color: primaryColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى اختيار النوع';
                          }
                          return null;
                        },
                      ),


                      SizedBox(height: 24.h),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(height: 20.h),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sizes.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: sizes[index]['size'],
                                  items: availableSizes
                                      .map((size) => DropdownMenuItem<String>(
                                    value: size,
                                    child: Text(size),
                                  ))
                                      .toList(),
                                  onChanged: (value) {
                                    _updateSize(index, value!);
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'المقاس',
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 10.w,
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 2,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    labelStyle: GoogleFonts.cairo(
                                      fontSize: 16.sp,
                                      color: primaryColor,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'يرجى اختيار المقاس';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: defaultTextFormFeild(
                                  context,
                                  validate: (value) {
                                    if (value == null || value == '') {
                                      return 'لا تترك هذا الحقل فارغا';
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  label: 'الكمية',
                                  onChanged: (value) {
                                    _updateQuantity(index, int.tryParse(value) ?? 0);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
                      ElevatedButton(
                        onPressed: _addSize,
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text('إضافة مقاس'),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                     TextFormField(
                        validator: (value)
                        {
                          if (value == null || value == '') {
                            return 'لا تترك هذا الحقل فارغا';
                          }

                          if (value.length < 20 ) {
                            return 'يجب ألا يقل الوصف عن 20 حرف';
                          }
                        },
                        keyboardType: TextInputType.multiline,
                        minLines: 4, // Set this
                        maxLines: 6,
                        controller: detailCon,
                        decoration: InputDecoration(
                          labelText: '        تفاصيل',

                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                          border: OutlineInputBorder(

                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelStyle: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            color:  primaryColor,
                          ),
                        ),
                      ),
                       SizedBox(height: 24.h),

                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    MaterialButton(
                      onPressed: ()
                      {


                        if(formAddTask.currentState!.validate())
                        {

                          cubit.createProductFun(
                            context,
                    name: nameProductCon.text ,
                            discount: discountCon.text,
                            category: selectedCategory ?? '',
                            color: colorCon.text,
                            photoPath: _photoPath.toString(),
                            sizes: _convertSizesToMap(),
                            price: priceCon.text,
                            brand: brandCon.text,
                            description: detailCon.text,
                            typeOfCloth: selectedType ?? '',

                          );


                        }

                      },

                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      height: 48.h,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                      color: SecondColor,
                      child: Text(
                        'حفظ',
                        style:  GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),



                  ],
                ),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
