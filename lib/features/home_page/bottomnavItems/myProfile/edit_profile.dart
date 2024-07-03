import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/logic/cubit.dart';
import 'package:graduation_project/features/logic/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../update_profile/update_profile_logic/update_profile_cubit.dart';
import '../../../update_profile/update_profile_logic/update_profile_state.dart';
XFile? pickedFile;
class EditProfile extends StatefulWidget {
   EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
   String maleValue = 'ذكر';
   String femaleValue = 'أنثى';
  @override
  void initState() {
    getDataProfile();
    // TODO: implement initState
    super.initState();
  }
  var fName = TextEditingController();
  var lName = TextEditingController();



  var emailController = TextEditingController();
String? currentImage;
void getDataProfile()
{

 fName.text = AppCubit.get(context).updateData!.data!.firstName.toString();
 lName.text = AppCubit.get(context).updateData!.data!.lastName.toString();
 emailController.text = AppCubit.get(context).updateData!.data!.email.toString();
 currentImage = AppCubit.get(context).updateData!.data!.file.toString();
}

  File? _image;

  Future getImage() async {
    var image;

    XFile? xImage = await ImagePicker.platform
        .getImage(source: ImageSource.camera);

    if (xImage != null) {
      setState(() {
        _image = File(xImage.path);
        pickedFile = xImage;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme(
          context: context,
          isReverse: true,
          title: S.of(context).edit_profile),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) {
if(state is EditSuccessAllUsersState)
{
  Navigator.pop(context);
}
          },
          builder: (context, state) =>  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),

                Stack(children: [
 pickedFile == null ?  CircleAvatar(
    radius: 70.0.r,
// here to get this image picker
    backgroundImage: NetworkImage
      (AppCubit.get(context).updateData!.data!.file.toString()),

  ) :
 CircleAvatar(
    radius: 70.0.r,
// here to get this image picker
    backgroundImage: FileImage(File(pickedFile!.path)),

  ),

  Positioned(
bottom: 0.0,
    right: 10.w,

    child:  InkWell(
      onTap: () async
      {
           getImage();
      },
      child: CircleAvatar(
        backgroundColor: Colors.cyan.shade100,
        radius: 20.0,
        child: const Icon(Icons.edit,color: Colors.white,),
      ),
    ),
  ),
],),

                SizedBox(height: 30.h),

                defaultTextFormFeild(
                  context,

                  validate:  (value)
                  {
                    if (value == null || value == '') {
                      return S.of(context).validate;
                    }
                  },
                  controller: fName,
                  label: 'الاسم الأول',
                  // hint: 'الاسم الاول',
                  keyboardType: TextInputType.name,
                  suffix: Container(),

                ),
                SizedBox(height: 24.h),
                defaultTextFormFeild(
                  context,

                  validate:  (value)
                  {
                    if (value == null || value == '') {
                      return S.of(context).validate;
                    }
                  },
                  controller: lName,
                  label: 'الاسم الأخير',
                  // hint: 'الاسم الاول',
                  keyboardType: TextInputType.name,
                  suffix: Container(),

                ),

                SizedBox(height: 40.h),
                defaultTextFormFeild(
                  context,
                  suffix: Container(),
                  validate:  (value)
                  {
                  },
                  controller: emailController,
                  label: S.of(context).email,

                  // hint: 'البريد الالكتروني',
                  keyboardType: TextInputType.emailAddress,

                ),

                SizedBox(height: 70.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: MaterialButton(

                    onPressed: ()
                    {
                      if(pickedFile != null){
                       AppCubit.get(context).updateUserProfile(
                         firstName: fName.text ,
                         email: emailController.text,
                         lastName: lName.text,
                         image: File(pickedFile!.path),
                       );
                      } else
                      {
                        AppCubit.get(context).updateUserProfile(
                          firstName: fName.text ,
                          email: emailController.text,
                          lastName: lName.text,

                        );
                      }


                    },
                    padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 80.w),
                    height: 48.h,
                    minWidth: 100.w,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    color: SecondColor,
                    child:  Center(
                      child: Row(
                        children: [
                        const  Icon(Icons.check,color: Colors.white,),
                          SizedBox(width: 10.w,),
                          Text(
                            S.of(context).save,
                            style:  GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
