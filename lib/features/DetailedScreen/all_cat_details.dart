


import 'dart:io';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/data_base/cache_helper/cache_helper.dart';
import 'package:graduation_project/features/auth/login/presentation/login.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constant/components/components.dart';
import '../../core/constant/const/const.dart';
import '../../core/constant/end_points/end_point.dart';
import '../../generated/l10n.dart';
import '../../styles/styles.dart';
import '../ShoppingCar/shopping_car.dart';
import '../ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import '../ShoppingCar/shopping_logic/shopping_logic_state.dart';
import '../admin/create_products/add_details.dart';
import '../admin/fit_screen.dart';
import '../auth/models/login_model.dart';
import '../home_page/Products/logic/cubit.dart';
import '../home_page/Products/logic/states.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';
int mountProduct = 1;
var fav = CacheHelper.getData(key: 'fav');
class AllCategoryDetailedScreen extends StatefulWidget {
int indexProduct;
int indexCat;
  AllCategoryDetailedScreen({required this.indexProduct,required this.indexCat});
  @override
  State<AllCategoryDetailedScreen> createState() => _AllCategoryDetailedScreenState();}
class _AllCategoryDetailedScreenState extends State<AllCategoryDetailedScreen> {
  bool isFav = false;
  bool showFullText = false;
  int _currentImageIndex = 0;
  bool isClick = false;
  String? selectedColor = '';
  int quantityAvailable = 0;
  int? selectedColorIndex;
  Details getDefaultDetails() {
    return Details(
      color: 'default',
      file: '',
      sizes: [],
      id: 'default',
    );}
  String selectedSize = '';
  late CarouselController _mainSliderController;
  @override
  void initState() {
    super.initState();
    _mainSliderController = CarouselController();
  }
  void updateQuantity(List<Sizes>? sizes, String size) {
    var sizeDetail = sizes!.firstWhere((element) => element.size == size, orElse: () => Sizes(size: 'default', quantity: 0, id: 'default'));
    setState(() {
      quantityAvailable = sizeDetail.quantity!;
    });
  }
  @override
  void didChangeDependencies() {
    mountProduct = 1;
    selectedColor = '';
    selectedSize = '';
    super.didChangeDependencies();
  }
  String? _photoPath;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final  pickedFile = await _picker.pickImage(source:
    ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _photoPath = pickedFile.path;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var sub = ProductsCubit.get(context);
    var cart = CardCubit.get(context);

    return BlocConsumer<ProductsCubit,ProductStates>(

      listener: (context, state) {
        if(state is DeleteProductsSuccessProduct || state is DeleteProductsErrorProduct)
        {
          Navigator.pop(context);
        }
      },
      builder: (context, state) =>  ConditionalBuilder(
        condition: sub.allProducts != null && sub.allProducts!.isNotEmpty,
        builder: (context) {

          var productDetails = sub.allProducts![widget.indexCat].products![widget.indexProduct].details!;
          var colors = productDetails.map((detail) => detail.color).toSet().toList();
          List<String?> getSizesForColor(String? color) {
            var selectedDetail = productDetails.firstWhere((detail) => detail.color == color, orElse: ()=> getDefaultDetails() );
            return selectedDetail.sizes?.map((size) => size.size).toList() ?? [];
          }

          if (selectedColor!.isEmpty && productDetails.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                selectedColor = productDetails[0].color;
                selectedColorIndex = 0;
                selectedSize = productDetails[0].sizes![0].size.toString();
                updateQuantity(productDetails[0].sizes, selectedSize);
              });
            });
          }

          var selectedDetail = productDetails.firstWhere(
                (detail) => detail.color == selectedColor,
            orElse: () => getDefaultDetails(),
          );

          return Scaffold(
              appBar:
              appBarDefaultTheme(context: context,
                  actions: [
                    (token != null && role == "super admin") || (role == "Products Owner" && sub.allProducts![widget.indexCat].products![widget.indexProduct].productOwner == userId) ?

                    InkWell(
                        onTap: ()
                        {
                          navigateTo(context, AddDetailsScreen(productId: sub.allProducts![widget.indexCat].products![widget.indexProduct].id.toString(),));
                        },
                        child: const Icon(Icons.add ,size: 35, color: Colors.blue,)):
                    Container(),

                    (token != null && role == "super admin") || (role == "Products Owner" && sub.allProducts![widget.indexCat].products![widget.indexProduct].productOwner == userId) ?
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: InkWell
                        (
                          onTap: ()
                          {
                            showDialog(context: context, builder: (context)
                            => Dialog(
                              child: Container(
                                height: 200.h,
                                width: 366.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 40.h,),
                                    Text('هل أنت متأكد من حذف هذا المنتج؟',style: Styles.style16SemiBold,),
                                    SizedBox(height: 40.h,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        defaultButtonSmall(context: context, text: 'حذف', width: 100.w, height: 40.h,
                                          textSize: 14.sp, toPage: ()
                                          {

                                            sub.deleteProductFun(productId: sub.allProducts![widget.indexCat].products![widget.indexProduct].id);
                                            Navigator.pop(context);
                                          },                           ),
                                        defaultButtonSmall(context: context, text: 'لا', width: 100.w, height: 40.h,
                                            textSize: 14.sp, toPage: ()
                                            {
                                              Navigator.pop(context);

                                            }),
                                      ],
                                    ),
                                  ], ),
                              ),
                            ),);
                          },
                          child:
                      Icon(Icons.delete , color: Colors.red,)),
                    ) : Container(),

                  ],
                  isReverse: true, title: 'معلومات المنتج'),

              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BlocConsumer<ProductsCubit, ProductStates>(
                  listener: (context, state) {},
                  builder: (context, state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h,),

                              // Main photo slider
                              productDetails.isNotEmpty ?
                              CarouselSlider(
                                carouselController: _mainSliderController,

                                options: CarouselOptions(
                                  height: 188.h,
                                  enlargeCenterPage: true,
                                  initialPage: _currentImageIndex,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentImageIndex = index;
                                    });
                                  },
                                ),
                                items:  selectedDetail.file!.isNotEmpty
                              ? productDetails.map((detail) {
                    return Builder(
                    builder: (BuildContext context) {
              return ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
              detail.file.toString(),
              fit: BoxFit.cover,),);},);
          }).toList() : [Center(child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3.0.r),
                                      child: SizedBox(
                                        height: 188.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16.r),
                                          child: Image.network(
                                            'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],) : Container(),

                                true ?
                              SizedBox(height: 15.h,) : Container(),

                              // Small photo slider
                  productDetails.isNotEmpty  ?
                              Center(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentImageIndex = index;
                                      });
                                    },
                                    height: 60.h,
                                    viewportFraction: 0.2,
                                    enlargeCenterPage: true,
                                  ),
                                  items: sub.allProducts![widget.indexCat].products![widget.indexProduct].details!.map((image) {
                                    int index = sub.allProducts![widget.indexCat].products![widget.indexProduct].details!.indexOf(image);
                                    return Container(
                                      height: 50.h,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: _currentImageIndex == index
                                            ? Colors.pinkAccent.shade100.withOpacity(0.4) // Change the color as needed
                                            : Colors.transparent,
                                      ),
                                      child: Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r),
                                              color: _currentImageIndex == index
                                                  ?  Colors.pinkAccent.shade100.withOpacity(0.4)
                                                  : Colors.transparent,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Set the main photo slider index to the selected image
                                                  _currentImageIndex = index;
                                                  // Jump to the selected image in the main slider
                                                  _mainSliderController.animateToPage(index,
                                                      duration: const Duration(milliseconds: 300),
                                                      curve: Curves.easeIn);
                                                },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.r),
                                                  child:   productDetails.isNotEmpty ? Image.network(
                                                    sub.allProducts![widget.indexCat].products![widget.indexProduct].details![index].file.toString(),
                                                    fit: BoxFit.cover,
                                                  ) : Container(),),),),);},),);}).toList(),),) : Container(), SizedBox(height: 20.h,), Text(
                                sub.allProducts![widget.indexCat].products![widget.indexProduct].name.toString(),
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,),),
                              SizedBox(height: 22.h,),
                              Row(
                                children: [
                                  Text(S.of(context).thePriceInDetail,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
                                  Spacer(),
                                  BlocConsumer<CardCubit,ShoppingStates>(
                                    listener: (context, state) {

                                    },
                                    builder: (context, state) =>  ElevatedButton(onPressed: ()
                                    {

                                      if(token == null) {showDialog(context: context, builder: (context) => Dialog(
                                              child: Container(
                                                height: 200.h,
                                                width: 366.w,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    SizedBox(height: 40.h,),
                                                    Text(
                                                      'يجب عليك تسجيل الدخول أولا',
                                                      style: Styles
                                                          .style16SemiBold,),
                                                    SizedBox(height: 40.h,),


                                                    Center(
                                                      child: defaultButton(
                                                        context: context,
                                                        text: 'تسجيل الدخول',

                                                        toPage: () async
                                                        {
                                                          navigateFinish(context,
                                                              LoginScreen());},),),],),),),);}
                                      else {
                                        print(   sub.allProducts![widget.indexCat].products![widget.indexProduct].details![_currentImageIndex].file.toString(),
                                        );
                                        showDialog(
                                          context: context, builder: (context) =>
                                            Dialog(
                                              child: _photoPath != null ? Flexible(
                                                child: Container(
                                                  // height: 400.h,
                                                  // width: 400.w,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      SizedBox(height: 40.h,),
                                                      Padding(
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: Text(
                                                          'تنويه : لنتيجة افضل يرجى رفع صورة للجزء العلوي فقط',
                                                          style: Styles
                                                              .style16SemiBold,
                                                        textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(height: 40.h,),

                                                      Center(
                                                        child: TextButton(
                                                          onPressed: _pickImage,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Icon(Icons.file_upload_outlined),
                                                              SizedBox(width: 5.w,),
                                                              Text('رفع صورة'),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      if (_photoPath != null) ...[
                                                        SizedBox(height: 20.h),
                                                        Image.file(
                                                            height: 300.h,
                                                            width: 400.w,
                                                            File(_photoPath!)),
                                                      ],
                                                      SizedBox(height: 30.h),

                                                      Center(
                                                        child: defaultButton(
                                                          context: context,
                                                          text: 'التالي',

                                                          toPage: () async
                                                          {

                                                            CardCubit.get(context).uploadImage
                                                              (File(_photoPath.toString()),
                                                                sub.allProducts![widget.indexCat].products![widget.indexProduct].details![_currentImageIndex].file.toString(),


                                                            );
                                                navigateTo(context, FitScreen());
                                                          },),
                                                      ),
                                                    ],),
                                                ),
                                              ) : Container(
                                                height: 400.h,
                                                width: 400.w,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    SizedBox(height: 40.h,),
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Text(
                                                        'تنويه : لنتيجة افضل يرجى رفع صورة للجزء العلوي فقط',
                                                        style: Styles
                                                            .style16SemiBold,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                    SizedBox(height: 40.h,),

                                                    Center(
                                                      child: TextButton(
                                                        onPressed: _pickImage,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.file_upload_outlined),
                                                            SizedBox(width: 5.w,),
                                                            Text('رفع صورة'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (_photoPath != null) ...[
                                                      SizedBox(height: 20.h),
                                                      Image.file(
                                                          height: 300.h,
                                                          width: 400.w,
                                                          File(_photoPath!)),
                                                    ],
                                                    SizedBox(height: 30.h),

                                                  ],),
                                              ),
                                            ),);

                                      }
                                    },
                                      style:  ElevatedButton.styleFrom(
                                          elevation: 10.0,
                                          padding:
                                          EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                                          backgroundColor: Color(0xff0A6847)),

                                      child: Row(
                                        children: [
                                          const   Icon(Icons.video_camera_back_outlined,color: Colors.white,),
                                          SizedBox(width: 8.w,),
                                          Text('جرب الان ( Fit )',style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w900),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Flexible(child: Text(    "${sub.allProducts![widget.indexCat].products![widget.indexProduct].priceAfterDiscount.toString()} جنيها   ",style : GoogleFonts.cairo(fontWeight:FontWeight.bold,color: SecondColor,fontSize: 18.sp ))),
                                  sub.allProducts![widget.indexCat].products![widget.indexProduct].discount!= null ?
                                  Flexible(child: Text(   " ${ sub.allProducts![widget.indexCat].products![widget.indexProduct].price.toString()} جنيها ",style : GoogleFonts.cairo(fontSize: 16.sp ,decoration: TextDecoration.lineThrough,color: Colors.grey))): SizedBox(),
                                  SizedBox(width: 20.w,),

                                ],
                              ),
                              SizedBox(height: 23.h,),
                              const Divider(color: fillRectangular,),
                              ///
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Flexible(child: Text(' الكمية المتاحة من المنتج : ${ sub.allProducts![widget.indexCat].products![widget.indexProduct].allQuantity}',style : GoogleFonts.cairo(fontWeight: FontWeight.w700,))),
                                  SizedBox(width: 50.w,),
                                  Text(' النوع  : ${ sub.allProducts![widget.indexCat].products![widget.indexProduct].typeOfCloth}',style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Text(' الماركة  : ${ sub.allProducts![widget.indexCat].products![widget.indexProduct].brand}',style : GoogleFonts.cairo(fontWeight: FontWeight.w700,color: Colors.blue)),
                                  SizedBox(width: 120.w,),
                                  Text(' خصم  : ${ sub.allProducts![widget.indexCat].products![widget.indexProduct].discount} %',style : GoogleFonts.cairo(fontWeight: FontWeight.w700,color: Colors.red)),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              const Divider(color: fillRectangular,),
// Color Dropdown
                              productDetails.isNotEmpty ?   Row(children: [
                               Text('الالوان المتاحة : ', style: GoogleFonts.cairo(fontWeight: FontWeight.w700)),
                               SizedBox(width: 20.w),
                             ],) : Container(),
                              SizedBox(height: 15.h),
                              productDetails.isNotEmpty
                                  ? Wrap(
                                spacing: 8.w,
                                children: colors.map((color) {
                                  int index = colors.indexOf(color);
                                  return ChoiceChip(
                                    label: Text(color.toString()),
                                    selected: selectedColor == color,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedColor = color;
                                        selectedColorIndex = index; // Setting selectedColorIndex
                                        selectedSize = productDetails[selectedColorIndex!].sizes![0].size.toString(); // Using selectedColorIndex

                                        updateQuantity(productDetails[selectedColorIndex!].sizes, selectedSize!); // Using selectedColorIndex
                                      });
                                    },
                                  );
                                }).toList(),
                              )
                                  : Container(),
                              /// ////////////////////////////
                              SizedBox(height: 10.h),
                              // Size Dropdown
                              productDetails.isNotEmpty ?  Row(children: [
                             Text('المقاسات المتاحة : ', style: GoogleFonts.cairo(fontWeight: FontWeight.w700)),
                             SizedBox(width: 20.w),

                             Container(
                               color:   gridColor,
                               child:  DropdownButton<String>(
                                 padding: EdgeInsets.symmetric(horizontal: 8.w),

                                 value: selectedSize,
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     selectedSize = newValue!;
                                     updateQuantity(selectedDetail.sizes, selectedSize);
                                   });
                                 },
                                 items: selectedDetail.sizes!.map<DropdownMenuItem<String>>((Sizes sizeDetail) {
                                   return DropdownMenuItem<String>(
                                     value: sizeDetail.size,
                                     child: Text(sizeDetail.size.toString()),
                                   );
                                 }).toList(),
                               ),

                             ),

                           ],) : Container(),
                              productDetails.isNotEmpty ? SizedBox(height: 15.h) : Container(),
                              productDetails.isNotEmpty || quantityAvailable == 0 ?     Text(' متوفر : $quantityAvailable قطعة ', style: GoogleFonts.cairo(fontWeight: FontWeight.w900,fontSize: 16.sp, color: SecondColor)):  Text('out of stock', style: GoogleFonts.cairo(fontWeight: FontWeight.w900,fontSize: 16.sp, color: SecondColor)),

                                  SizedBox(height: 10.h,),
                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,

                                       children: [






                              ///
                              SizedBox(height: 10.h,),




                              /// to do read more
                              Text('الوصف',style :
                              GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
                                         SizedBox(height: 10.h,),
                                         Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sub.allProducts![widget.indexCat].products![widget.indexProduct].description.toString(),

                                    maxLines: showFullText ? 200 : 2, // Unlimited lines if showFullText is true
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),


                                  sub.allProducts![widget.indexCat].products![widget.indexProduct].description!.length > 100 ?
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,

                                    ),
                                    onPressed: () {
                                      // Toggle the visibility of the full text
                                      setState(() {
                                        showFullText = !showFullText;
                                      });
                                    },
                                    child: Text(

                                      showFullText ? S.of(context).readLess : S.of(context).readMore,
                                      style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          decoration: TextDecoration.underline,
                                          color: SecondColor),
                                    ),
                                  ) : Container() ,
                                ],
                              ),

                              SizedBox(height: 30.h,),





                            ],
                          ),


                    ],
                  ),
                              //here i want to add details :


               ], ),
              ),
            ),
                      Row(
                        children: [
                          SizedBox(width: 34.w,),

                          BlocConsumer<CardCubit,ShoppingStates>(
                            listener: (context, state) {

                            },
                            builder: (context, state) => buttonAddCard(
                              context: context,
                              text: S.of(context).AddToCar,
                              iconText: 'assets/images/shop.svg',
                              toPage: (){

if(token != null && quantityAvailable != 0 ) {
  CardCubit.get(context).addInCard(
    context,
/// here i want the index of the details photo that user choose
    imageOfProduct:  productDetails[selectedColorIndex!].file!,
    size: selectedSize,
    priceAfterDiscount: sub.allProducts![widget.indexCat].products![widget
        .indexProduct].priceAfterDiscount.toString(),
    color: selectedColor.toString(),
    productId: sub.allProducts![widget.indexCat].products![widget.indexProduct]
        .id.toString(),
    name: sub.allProducts![widget.indexCat].products![widget.indexProduct].name
        .toString(),
    detailsId:
      productDetails[selectedColorIndex!].id!,);
  navigateTo(context, ShoppingCar(reverse: true,));
} else
{
  showDialog(context: context, builder: (context)
  => Dialog(
    child: Container(
      height: 200.h,
      width: 366.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h,),
          Text('يجب عليك تسجيل الدخول أولا',style: Styles.style16SemiBold,),
          SizedBox(height: 40.h,),
          Center(
            child: defaultButton(context: context, text: 'تسجيل الدخول',
            toPage: () async
              { navigateFinish(context, LoginScreen());
              },                           ),
          ),
        ], ),
    ),
  ),);
}
                                setState(() {
                                  mountProduct = 1;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          BlocConsumer<ProductsCubit,ProductStates>(
                            listener: (context, state) {
                            },
                            builder: (context, state)
                              {
                                if(state is PostLoadingFavState || state is DeleteFavLoadingProduct || state is GetAllProductsLoadingProduct) {
                                return const  CircularProgressIndicator();}
                                  return Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 48.h,
                                    width: 46.w,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: fillRectangular),

                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (token != null) {
                                          setState(() {
                                            if (!sub.allProducts![widget.indexCat]
                                                .products![widget.indexProduct]
                                                .favorite!) {
                                              ProductsCubit.get(context)
                                                  .addInFavFun(
                                                productId: sub
                                                    .allProducts![widget
                                                    .indexCat].products![widget
                                                    .indexProduct].id
                                                    .toString(),

                                              );
                                            }
                                            if (sub.allProducts![widget.indexCat]
                                                .products![widget.indexProduct]
                                                .favorite!) {
                                              ProductsCubit.get(context)
                                                  .deleteFromFavFun(
                                                productId: sub
                                                    .allProducts![widget
                                                    .indexCat].products![widget
                                                    .indexProduct].id
                                                    .toString(),);}});
                                          isFav = !isFav;
                                        }
                                        else {
                                          showDialog(context: context,
                                            builder: (context) =>
                                                Dialog(
                                                  child: Container(
                                                    height: 200.h,
                                                    width: 366.w,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        SizedBox(height: 40.h,),
                                                        Text(
                                                          'يجب عليك تسجيل الدخول أولا',
                                                          style: Styles
                                                              .style16SemiBold,),
                                                        SizedBox(height: 40.h,),


                                                        Center(
                                                          child: defaultButton(
                                                            context: context,
                                                            text: 'تسجيل الدخول',

                                                            toPage: () async
                                                            {
                                                              navigateFinish(
                                                                  context,
                                                                  LoginScreen());
                                                            },),
                                                        ),
                                                      ],),
                                                  ),
                                                ),);
                                        }
                                      }
                                      ,
                                      child: sub.allProducts![widget.indexCat]
                                          .products![widget.indexProduct]
                                          .favorite! ? SvgPicture.asset(
                                        'assets/images/heart-fill.svg',
                                        color: Colors.red,
                                        height: 30.h,
                                        width: 30.w,)
                                          : SvgPicture.asset(
                                        'assets/images/Favorite .svg',),
                                    ),
                                  );
                                }
                          ),

                        ],
                      ),
                      SizedBox(height: 20.h,),
         ], ),
          ),
         ), );
          },




        fallback: (context) => Scaffold(
            backgroundColor:  Colors.pinkAccent.shade100.withOpacity(0.5),
            body: Center(child: loader())),
      ),
    );



  }

  Widget expandComments () => Padding(
    padding:  EdgeInsets.symmetric(horizontal: 20.w),
    child: Container(
      width: double.infinity,
      child: Row(
mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: 50.h,
            width: 1.w,
            color: fillRectangular,
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [

                  SizedBox(width: 10.w),
                  Text('5 نجوم '),
                ]),

                Flexible(child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
'nice',
                )),

              ],
            ),
          ),
        ],
      ),
    ),
  );

}

