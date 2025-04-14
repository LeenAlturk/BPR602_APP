import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/ChangePasswordcubit/change_password_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangepasswordErrorState) {
            AppConstants.showToast(context, state.message);
          }
          if (state is ChangepasswordAcceptState) {
            AppConstants.showToast(context, "password changed succesfully");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Kbackground,
              title: const Text(
                'Change Password',
                style: TextStyle(color: Ktext),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kbutton,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              automaticallyImplyLeading: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Form(
                        key: context.read<ChangePasswordCubit>().formKey1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InputTextForm(
                                formValidator: context
                                    .read<ChangePasswordCubit>()
                                    .passwordValidator,
                                prefIcon: Icons.password,
                                hintText: 'Enter your Password',
                                iconData: Icons.password,
                                onChange: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InputTextForm(
                                formValidator: context
                                    .read<ChangePasswordCubit>()
                                    .newpasswordValidator,
                                prefIcon: Icons.password,
                                hintText: 'Enter your New Password',
                                iconData: Icons.password,
                                onChange: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InputTextForm(
                                formValidator: context
                                    .read<ChangePasswordCubit>()
                                    .confirmpasswordValidator,
                                prefixIcon: Icons.password,
                                prefIcon: Icons.password,
                                hintText: 'Confirm Your New Password',
                                iconData: Icons.password,
                                onChange: () {},
                              ),
                            ),
                            state is ChangepasswordAwaitState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedBtn(
                                    //minWidth: 200.0,
                                    //minHeight: 20.0,
                                    buttonText: "ChangePassword ",
                                    onPressed: () {
                                      if (context
                                              .read<ChangePasswordCubit>()
                                              .newpasswordValidator
                                              .controller
                                              .text !=
                                          context
                                              .read<ChangePasswordCubit>()
                                              .confirmpasswordValidator
                                              .controller
                                              .text) {
                                        AppConstants.showToast(context,
                                            'password and confirmed not match');
                                      } else if (context
                                          .read<ChangePasswordCubit>()
                                          .confirmpasswordValidator
                                          .controller
                                          .text
                                          .isEmpty) {
                                        AppConstants.showToast(context,
                                            ' confirm password is Empty ');
                                      } else if (context
                                          .read<ChangePasswordCubit>()
                                          .newpasswordValidator
                                          .controller
                                          .text
                                          .isEmpty) {
                                        AppConstants.showToast(
                                            context, 'New password is Empty');
                                      } else if (context
                                          .read<ChangePasswordCubit>()
                                          .passwordValidator
                                          .controller
                                          .text
                                          .isEmpty) {
                                        AppConstants.showToast(
                                            context, 'Old password is Empty');
                                      } else {
                                        context
                                            .read<ChangePasswordCubit>()
                                            .changepass();
                                      }
                                    },
                                    backgroundColor: kbutton,
                                    textColor: Kbackground,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
