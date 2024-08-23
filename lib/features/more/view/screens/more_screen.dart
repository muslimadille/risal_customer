import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/features/more/view/screens/info_screen.dart';
import 'package:risal_customer/features/more/view_model/more_screen_helper.dart';
import 'package:sizer/sizer.dart';

import '../items/more_item_widget.dart';
import '../items/more_white_container.dart';
import '../items/user_card_widget.dart';

class MoreScreen extends StatelessWidget with MoreScreenHelper {
   MoreScreen():super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 7.h,),
       UserCardWidget(),
      SizedBox(height:2.h,),
      MoreWhiteContainer(body:MoreItemWidget(suffix: AppImages.LOGIN_CHANGE_LANGUAGE_IC, title: 'change_lang'.translate, onClick: ()async{
        //CustomBottomSheet().displayModalBottomSheet(widget: ChangeLanguageBottomSheet());
        await AppLocalization.changeLanguage();
        AppNavigator().pushReplacement(routeName: AppRoutes.HOME_TABS_SCREEN_ROUTE,arguments: 2);

      },) ,),
      SizedBox(height:2.h,),
      MoreWhiteContainer(body: Column(children: [
        MoreItemWidget(suffix: AppImages.MORE_HELP_CENTER_IC, title: 'help_center_btn_title'.translate,prefix: true, onClick: (){

         },),
        SizedBox(height: 2.h,),
        MoreItemWidget(suffix: AppImages.MORE_TERMS_IC, title: 'terms_btn_title'.translate,prefix: true, onClick: (){

          AppNavigator().push(routeName: AppRoutes.INFO_SCREEN_ROUT,arguments: InfoScreenArgument(title: "terms_btn_title", content: "dgsgsdgdsgsdgsdgsdgsdgsdgsd"));
        },),
         SizedBox(height: 2.h,),
         MoreItemWidget(suffix: AppImages.MORE_PRIVACY_IC, title: 'privacy_btn_title'.translate,prefix: true, onClick: (){

        },),

      ],),),
      SizedBox(height:2.h,),
      MoreWhiteContainer(body:MoreItemWidget(suffix: AppImages.MORE_LOGOUT_IC, title: 'log_out'.translate, onClick: (){
        logout();
      },) ,),
    ],);
  }
}
