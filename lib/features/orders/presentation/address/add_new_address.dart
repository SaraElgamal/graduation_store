import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/orders/presentation/address/all_addresses.dart';
import 'package:graduation_project/features/orders/presentation/way_to_pay.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../core/constant/const/transition.dart';
import '../../../../core/utils/toast.dart';
import '../../../../generated/l10n.dart';
import '../../../home_page/home_page.dart';
import '../thankyou.dart';
import 'models/city.dart';
import 'models/district.dart';
import 'models/region.dart';

class AddNewAddress extends StatefulWidget {
   AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  var formKeyA = GlobalKey<FormState>();
   List<Region> regions = [];

   List<City> cities = [];

   List<District> districts = [];

   String selectedRegion = '';
   String regionName = '';
   String cityName = '';
   String districtName = '';

   String selectedCity = '';

   String selectedDistrict = '';

  var fullName = TextEditingController();

  var address = TextEditingController();

  var phone_number = TextEditingController();
  var other_phone_number = TextEditingController();

  var message = TextEditingController();
   @override
   void initState() {
     super.initState();
     loadRegionData();
   }

   Future<void> loadRegionData() async {
     // Load your region data from JSON file or API
     String regionData = await rootBundle.loadString('assets/json/regions_lite.json');
     List<dynamic> regionList = json.decode(regionData);

     setState(() {
       regions = regionList.map((json) => Region.fromJson(json)).toList();

     });
   }

   Future<void> loadCityData(int regionId) async {
     // Load your city data based on the selected region
     String cityData = await rootBundle.loadString('assets/json/cities_lite.json');
     List<dynamic> cityList = json.decode(cityData);

     setState(() {
       cities = cityList
           .where((city) => city['region_id'] == regionId)
           .map((json) => City.fromJson(json))
           .toList();
       log(cities![0].name_ar.toString());
     });
   }

   Future<void> loadDistrictData(int cityId) async {
     // Load your district data based on the selected city
     String districtData = await rootBundle.loadString('assets/json/districts_lite.json');
     List<dynamic> districtList = json.decode(districtData);

     setState(() {
       districts = districtList
           .where((district) => district['city_id'] == cityId)
           .map((json) => District.fromJson(json))
           .toList();
       log(districts![0].name_ar.toString());

     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme(
          context: context, isReverse: true, title: 'ادخل عنوانك'),
       body:

    Padding(
           padding:  EdgeInsets.symmetric(horizontal : 20.w),
           child: Form(
             key: formKeyA,
             child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: Column(children: [
                 SizedBox(height: 30.h,),
               //
               //                      defaultTextFormFeild(
               //                        context,
               //
               //                        validate:  (value)
               //                        {
               //                          if (value == null || value == '') {
               //                            return S.of(context).validate;
               //                          }
               //                        },
               //                        controller: fullName,
               //                        label: S.of(context).FullName,
               //                        // hint: 'الاسم الاول',
               //                        keyboardType: TextInputType.name,
               //                        suffix: Container(),
               //
               //                      ),
               //                      SizedBox(height: 24.h),
               //                      defaultTextFormFeild(
               //                        context,
               //                        suffix: Container(),
               //                        validate:  (value)
               //                        {
               //                          if (value == null || value == '') {
               //                            return S.of(context).validate;
               //                          }
               //                        },
               //                        controller: phone_number,
               //                        label:  S.of(context).mobile_number,
               //
               //                        // hint: 'البريد الالكتروني',
               //                        keyboardType: TextInputType.phone,
               //
               //                      ),
               //                      SizedBox(height: 24.h),
               //                      defaultTextFormFeild(
               //                        context,
               //                        suffix: Container(),
               //                        validate:  (value)
               //                        {
               //                        },
               //                        controller: other_phone_number,
               //                        label:  S.of(context).AnotherPhone,
               //
               //                        // hint: 'البريد الالكتروني',
               //                        keyboardType: TextInputType.phone,
               //
               //                      ),
               //                      /// to do 3 drop down menu
               //                      SizedBox(height: 24.h),
               //                      Container(
               //                        padding: EdgeInsets.symmetric(horizontal: 16.w),
               //                        decoration: BoxDecoration(
               //                          border: Border.all(color: fillRectangular),
               //                            borderRadius: BorderRadius.circular(10),
               //
               //                      ),
               //                        child: DropdownButton<String>(
               //                          borderRadius: BorderRadius.circular(10),
               //                          isExpanded: true,
               //                          hint: Text( S.of(context).chooseRegion),
               //                          value: selectedRegion.isNotEmpty ? selectedRegion : null,
               //                          onChanged: (value) {
               //                            log(value.toString());
               //                            setState(() {
               //                              selectedRegion = value!;
               //                              selectedCity = '';
               //                              selectedDistrict = '';
               //                              regionName = regions
               //                                  .firstWhere((region) => region.region_id.toString() == value)
               //                                  .name_ar.toString();
               //                              loadCityData(int.parse(value));
               //
               //
               //                            });
               //                          },
               //                          items: regions
               //                              .map(
               //                                (region) {
               //
               //                                  return DropdownMenuItem(
               //                              value: region.region_id.toString(),
               //                              child: Text(region.name_ar.toString()),
               //
               //
               //                                  );
               // },
               //                          )
               //                              .toList(),
               //                        ),
               //                      ),
               //                    const  SizedBox(height: 24),
               //
               //                      Container(
               //                        padding: EdgeInsets.symmetric(horizontal: 16.w),
               //
               //                        decoration: BoxDecoration(
               //                          border: Border.all(color: fillRectangular),
               //                          borderRadius: BorderRadius.circular(10),
               //
               //                        ),
               //                        child: DropdownButton<String>(
               //                          hint: Text( S.of(context).chooseCity),
               //                          isExpanded: true,
               //                          value: selectedCity.isNotEmpty ? selectedCity : null,
               //                          onChanged: (value) {
               //                            setState(() {
               //                              selectedCity = value!;
               //                              selectedDistrict = '';
               //                              cityName = cities
               //                                  .firstWhere((city) => city.city_id.toString() == value)
               //                                  .name_ar.toString();
               //                              loadDistrictData(int.parse(value));
               //                            });
               //                          },
               //                          items: cities
               //                              .map(
               //                                (city)
               //                                {
               //
               //
               //
               //                                  return DropdownMenuItem(
               //                                     value: city.city_id.toString(),
               //                                     child: Text(city.name_ar.toString()),
               //                                   );
               //                                 })
               //                              .toList(),
               //                        ),
               //                      ),
               //                   const   SizedBox(height: 24),
               //                      // District Dropdown
               //                    Container(
               //                      padding: EdgeInsets.symmetric(horizontal: 16.w),
               //
               //                      decoration: BoxDecoration(
               //                          border: Border.all(color: fillRectangular),
               //                          borderRadius: BorderRadius.circular(10),
               //
               //                        ),
               //
               //                        child: DropdownButton<String>(
               //                          hint: Text( S.of(context).chooseDistrict),
               //                          isExpanded: true,
               //                          value: selectedDistrict.isNotEmpty ? selectedDistrict : null,
               //                          onChanged: (value) {
               //                            setState(() {
               //                              selectedDistrict = value!;
               //                             districts.isNotEmpty ?
               //                             districtName =
               //                              districts
               //                                  .firstWhere((district) => district.district_id.toString() == value)
               //                                  .name_ar.toString() : districtName = 'لا يوجد';
               //                            });
               //                          },
               //                          items: districts
               //                              .map(
               //                                (district)  {
               //
               //                               return DropdownMenuItem(
               //                                value: district.district_id.toString(),
               //                                child: Text(district.name_ar.toString()),
               //                                );
               //                          }
               //                          )
               //                              .toList(),
               //                        ),
               //                      ),
               //                      SizedBox(height: 24.h),
               //                      defaultTextFormFeild(
               //                        context,
               //
               //                        validate:  (value)
               //                        {
               //                          if (value == null || value == '') {
               //                            return S.of(context).validate;
               //                          }
               //                        },
               //                        controller: address ,
               //                        label:  S.of(context).AddressLabel,
               //                         hint: S.of(context).TellUsAddress,
               //                        keyboardType: TextInputType.text,
               //                        suffix: Container(),
               //
               //                      ),
                 SizedBox(height: 200.h),
                 TextFormField(
             validator: (value) {
               if (value == null || value == '') {
                 return S.of(context).validate;
               }
             },
                   keyboardType: TextInputType.multiline,
                   minLines: 4, // Set this
                   maxLines: 6,
                   controller: message,
                   decoration: InputDecoration(
                     labelText: 'ادخل العنوان بالتفصيل',

                     alignLabelWithHint: true,
                     contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                     border: OutlineInputBorder(
                       gapPadding: 2,
                       borderRadius: BorderRadius.circular(14),
                     ),
                     labelStyle: GoogleFonts.tajawal(
                       fontSize: 16.sp,
                       color: const Color(0xff606F7B),
                     ),
                   ),
                 ),
                 SizedBox(height: 100.h),
                 defaultButton(
                   context: context,

                   text: 'التالي',

                   toPage: (){
                     navigateTo(context,  const WayToPay());
                   },
                 ),
               ]),
             ),
           ),
         ),
      // ),
    );
  }
}
