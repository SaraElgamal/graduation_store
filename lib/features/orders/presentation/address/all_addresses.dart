import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/orders/presentation/thankyou.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../ShoppingCar/shopping_car.dart';
import '../../logic/cubit.dart';
import '../../logic/states.dart';
import 'add_new_address.dart';

int idAddressChosen = 1 ;
class AllAddresses extends StatefulWidget {
  const AllAddresses({Key? key}) : super(key: key);

  @override
  State<AllAddresses> createState() => _AllAddressesState();
}

class _AllAddressesState extends State<AllAddresses> {
  bool isSelected = false;
  @override
  void initState() {



    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
  //  OrdersCubit.get(context).getAddressById(user_id:idUser!.toInt());

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var order = OrdersCubit.get(context);
    return Scaffold(
      appBar: appBarDefaultTheme(
          context: context, isReverse: true, title: S.of(context).Address),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal : 20.w),
        child: Column(
          children: [
            BlocConsumer<OrdersCubit,OrdersStates>(
              listener: (context, state) {

             //   OrdersCubit.get(context).getAddressById(user_id: idUser!.toInt());
              },
              builder: (context, state) =>  Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    SizedBox(height: 30.h,),
                    ListView.separated
                      (
                        shrinkWrap: true,
                        physics: const
                        NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            addressCard(index),
                        separatorBuilder:  (context, index) =>  const Divider(color: fillRectangular),
                        itemCount: 1
                    ),
                    SizedBox(height: 20.h,),
                    TextButton(onPressed: ()
                    {
                      navigateFinish(context,  AddNewAddress());
                    },
                        style: TextButton.styleFrom(
fixedSize: Size(200.w, 50.h),
                          shape: const StadiumBorder(

                            side: BorderSide(width: 3,color: SecondColor)
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         const   Icon(Icons.add_circle_outline),
                            SizedBox(width: 10.w,),
                            Text(S.of(context).AddNewAddress,),
                          ],
                        )),

                  ]),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                SizedBox(width: 40.w,),

          cardBook ?  buttonAddCard(
                  context: context,
                  text: 'التالي',
                  iconText: 'assets/images/shop.svg',
                  toPage: (){
navigateTo(context,  const ThankYou());
                  },
                ) : Container(),
                SizedBox(width: 10.w,),


              ],
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );


  }
  int selectedAdd = 0;
  Widget addressCard(int index) => InkWell(
    onTap: ()
    {
      setState(() {
        selectedAdd = index;
       idAddressChosen =  0;
      });

    },
    child: Container(
      padding: const EdgeInsets.all(10),
     width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        border: Border.all(color: selectedAdd == index ? SecondColor : fillRectangular,width: 3),
        borderRadius: BorderRadius.circular(16),
color: selectedAdd == index ? gridColor : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(' الاسم : ',
                style: GoogleFonts.cairo(fontWeight: FontWeight.bold),),
              Text('sara elgamal'),
            ],
          ),

          Text('cairo , nasr city'),
          Row(
            children: [
              Text(' الهاتف : ',style: GoogleFonts.cairo(fontWeight: FontWeight.bold),),
              Text('01551215537'),
            ],
          ),
          Row(
            children: [
              Flexible(child: Text( ' الهاتف البديل : ' ,style: GoogleFonts.cairo(fontWeight: FontWeight.bold),)),
              Text( '0123659845'),

              SizedBox(width: 10.w,),
  ],),
        ],
      ),
    ),
  );
}

