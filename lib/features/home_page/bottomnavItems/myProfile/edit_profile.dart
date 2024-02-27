import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var fullName = TextEditingController();

   String selectedGender = '';
   bool  isMale = false;

  var emailController = TextEditingController();
String? currentImage;
void getDataProfile()
{
 //ProfileUserCubit.get(context).getProfile();

 fullName.text = 'sara elgamal';
 emailController.text = 'sara@gmail.com';
 selectedGender = 'female';
 currentImage = 'https://cdn-icons-png.flaticon.com/512/3177/3177440.png';
}

  File? _image;

  Future getImage() async {
    var image;

    // Use XFile instead of var to explicitly type the result
    XFile? xImage = await ImagePicker.platform.getImage(source: ImageSource.gallery);

    // Check if xImage is not null before converting it to File
    if (xImage != null) {
      setState(() {
        // Use File constructor to convert XFile to File
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
        child: BlocConsumer<ProfileUserCubit,ProfileUserProfileState>(
          listener: (context, state) {

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
      ('https://cdn-icons-png.flaticon.com/512/3177/3177440.png'),

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
        // to do image picker
      //  print(ProfileUserCubit.get(context).profile!.imageProfile.toString());
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
                  controller: fullName,
                  label: S.of(context).FullName,
                  // hint: 'الاسم الاول',
                  keyboardType: TextInputType.name,
                  suffix: Container(),

                ),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: fillRectangular),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    isExpanded: true,
                    hint: Text(S.of(context).gender),
                    value: isMale ? maleValue : femaleValue,
                    onChanged: (value) {
                      log(value.toString());
                      setState(() {
                        isMale = value == maleValue;
                       // print('$isMale $value $maleValue');
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: maleValue,
                        child: Text(S.of(context).male),
                      ),
                      DropdownMenuItem(
                        value: femaleValue,
                        child: Text(S.of(context).female),
                      ),
                    ],
                  ),
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
                        // ProfileUserCubit.get(context).submitFormData(
                        //     name: fullName.text,
                        //     gender: isMale ? '0' : '1',
                        //     image:   XFile(pickedFile!.path),
                        //     email: emailController.text);
                      } else
                      {
                        // ProfileUserCubit.get(context).submitFormData(
                        //     name: fullName.text,
                        //     gender: isMale ? '0' : '1',
                        //     email: emailController.text,
                        //
                        // );
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
