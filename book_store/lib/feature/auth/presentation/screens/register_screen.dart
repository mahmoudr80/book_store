import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/widgets/customTextRich.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/domain/usecases/register_usecase.dart';
import 'package:book_store/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:book_store/feature/auth/presentation/widgets/register_form.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_snackBar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_back_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var key = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<RegisterUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(tapped: () => Navigator.pop(context)),
          leadingWidth: 60.w,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 11.h, bottom: 19.h, left: 22.w, right: 22.w,),
            child: Column(
              children: [
                Spacer(flex: 3),
                Container(
                  padding: EdgeInsets.only(right: 73.w),
                  child: Text(
                    LocaleKeys.auth_register_greeting.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Spacer(flex: 3),
                RegisterForm(
                  usernameController: usernameController,
                  emailController: emailController,
                  passController: passController,
                  confirmPassController: confirmPassController,
                  formKey: key,
                ),
                Spacer(flex: 3),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (BuildContext context, state) {
                    if (state is RegisterFailed) {
                      AppSnackbar.showError(context, state.errMessage);
                    } else if (state is RegisterSuccess) {
                      AppSnackbar.showSuccess(
                        context,
                        LocaleKeys.registered_successfully.tr(),
                      );
                      Navigator.pushNamed(
                        context,
                        RoutesScreens.homeScreen,
                        arguments: state.user,
                      );
                    }
                  },
                  builder: (context, state) => AppButton(
                    label: LocaleKeys.auth_register.tr(),
                    tapped: () {
                      if (key.currentState?.validate() ?? false) {
                        context.read<RegisterCubit>().register(
                          UserModel(name: usernameController.text, email: emailController.text, password: passController.text, password_confirmation: confirmPassController.text,),
                        );
                      } else {
                        AppSnackbar.showError(
                          context,
                          LocaleKeys.invalid_registration.tr(),
                        );
                      }
                    },
                  ),
                ),
                Spacer(flex: 18),
                Customtextrich(
                  textTitle: LocaleKeys.auth_already_have_account.tr(),
                  textButton: LocaleKeys.auth_login_now.tr(),
                  tapped: () => Navigator.pushReplacementNamed(context, RoutesScreens.loginScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
