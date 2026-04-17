import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/feature/cart/presentation/widget/user_form.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_button.dart';
import '../widget/price_widget.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
   TextEditingController? nameController;
   TextEditingController ?emailController;
   TextEditingController ?addressController;
   TextEditingController ?phoneController;
   TextEditingController ?governorateController;
   GlobalKey<FormState>?formKey;

  @override
  void initState() {
    nameController=TextEditingController();
    emailController=TextEditingController();
    addressController=TextEditingController();
    phoneController=TextEditingController();
    governorateController=TextEditingController();
    formKey=GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CustomBackButton(tapped: () => Navigator.pop(context),),
        ),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.h,bottom: 25.h,top: 21.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Place Your Order",style: AppTextStyle.headlineStyle,),
          Text("Don't worry! It occurs. Please enter the email address linked with your account.",
            style: AppTextStyle.hintStyle,),
            SizedBox(height: 15.h,),
            UserForm(nameController: nameController, emailController: emailController,
                addressController: addressController, phoneController: phoneController,
                governorateController: governorateController, formKey: formKey),
           Spacer()
           , Column(
              spacing: 19.h,
              children: [
                PriceWidget(),
                AppButton(label: "Submit Order",tapped: () {
                  if(formKey?.currentState?.validate()??false){
                    Navigator.pushNamed(context,RoutesScreens.congratsScreen);
                  }else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Form data incorrect",style: TextStyle(color: Colors.white),)
                    ,backgroundColor: Colors.redAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100.r)),),
                    );
                  }
                  
                },)
              ],
            )
          ],
        ),
      ),
    );
  }
}
