import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/utils/app_snackBar.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/customTextRich.dart';
import 'package:book_store/feature/auth/data/repository/auth_repositoryImp.dart';
import 'package:book_store/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:book_store/feature/auth/presentation/widgets/login_form.dart';
import 'package:book_store/feature/auth/presentation/widgets/sign_in_widget.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/dependency_injection/service_locator.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var key = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 60.w,
          leading: CustomBackButton(tapped: () => Navigator.pop(context)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 11.h,
              bottom: 19.h,
              left: 22.w,
              right: 22.w,
            ),
            child: Column(
              children: [
                Spacer(flex: 4),
                Container(
                  padding: EdgeInsets.only(right: 73.w),
                  child: Text(
                    LocaleKeys.auth_welcome_back.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Spacer(flex: 4),
                LoginForm(emailController: emailController,
                  passController: passController,formKey: key,),
                Spacer(flex: 1),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Customtextrich(
                      textButton: LocaleKeys.auth_forgot_password.tr(),
                      tapped: () => Navigator.pushNamed(context, RoutesScreens.forgetPasswordScreen),
                    ),
                  ],
                ),
                Spacer(flex: 4),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailed) {
                      Navigator.pop(context);
                      AppSnackbar.showError(context, state.errMessage);
                    } else if (state is LoginSuccess) {
                      AppSnackbar.showSuccess(
                        context,
                        LocaleKeys.login_successfully.tr(),
                      );
                      Navigator.pushNamed(
                        context,
                        RoutesScreens.homeScreen,
                        arguments: state.user,
                      );
                    }
                    else if (state is LoginLoading) {
                    showDialog(context: context,
                        builder:(context) => Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),),);
                    }
                  },
                  builder: (context, state)
                    {
                    return  AppButton(
                        label: LocaleKeys.login.tr(),
                        tapped: () {
                          if (key.currentState?.validate() ?? false) {
                            context.read<LoginCubit>().login(
                              emailController.text,
                              passController.text,
                            );
                          } else {
                            AppSnackbar.showError(
                              context,
                              LocaleKeys.invalid_credential.tr(),
                            );
                          }
                        },
                      );
                    }

                ),
                Spacer(flex: 4),
                SizedBox(width: 331.w, height: 167.h, child: SignInWidget()),
                Spacer(flex: 12),
                Customtextrich(
                  textTitle: LocaleKeys.auth_no_account.tr(),
                  textButton: LocaleKeys.auth_register_now.tr(),
                  tapped: ()=>Navigator.pushReplacementNamed(context, RoutesScreens.registerScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
