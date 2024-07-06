




import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/styles/styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/components/components.dart';
import '../../../core/constant/const/const.dart';
import '../../home_page/Products/logic/cubit.dart';
import '../../home_page/Products/logic/states.dart';

class AddDetailsScreen extends StatefulWidget {
String productId ;

  AddDetailsScreen({required this.productId});

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {



  var colorCon = TextEditingController();



  var formAddDetail = GlobalKey<FormState>();



  Map<String, int> _convertSizesToMap() {
    Map<String, int> sizeMap = {};
    for (var size in sizes) {
      if (size['size'] != null && size['quantity'] != null) {
        sizeMap[size['size']] = size['quantity'];
      }
    }
    return sizeMap;
  }

  List<String> availableSizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  String? _photoPath;
  final ImagePicker _picker = ImagePicker();

  List<Map<String, dynamic>> sizes = [];

  Future<void> _pickImage() async {
    final  pickedFile = await _picker.pickImage(source:
    ImageSource.gallery);
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

      },
      builder: (context, state) => Scaffold(
        appBar: appBarDefaultTheme(
            context: context, isReverse: true, title: 'إضافة تفاصيل لهذا المنتج'),
        body:

        Padding(
          padding:  EdgeInsets.symmetric(horizontal : 20.w),
          child: Form(
            key: formAddDetail,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      SizedBox(height: 30.h,),



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
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Text('أضف صورة بهذا اللون:',style: Styles.style14Bold,),
                        ],
                      ),
                      SizedBox(height: 20.h,),
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


                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    MaterialButton(
                      onPressed: ()
                      {


                        if(formAddDetail.currentState!.validate())
                        {

                          cubit.addDetailsRequest(
                         productId: widget.productId,
                            color: colorCon.text,
                            photoPath: _photoPath.toString(),
                            sizes: _convertSizesToMap(),

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
