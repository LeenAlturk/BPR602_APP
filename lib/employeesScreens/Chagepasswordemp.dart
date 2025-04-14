
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/ChangePasswordempcubit/change_passwordemp_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chagepasswordemp extends StatelessWidget {
  const Chagepasswordemp({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ChangePasswordempCubit(),
      child: BlocConsumer<ChangePasswordempCubit, ChangePasswordempState>(
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
                        key: context.read<ChangePasswordempCubit>().formKey1,
                        child: Column(
                          children: [
                            const Text(
                              'Change your Password account',
                              style: TextStyle(color: Ktext),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(size.height * 0.01),
                              child: InputTextForm(
                                formValidator: context
                                    .read<ChangePasswordempCubit>()
                                    .passwordValidator,
                                prefIcon: Icons.password,
                                hintText: 'Enter your Password',
                                iconData: Icons.password,
                                onChange: () {},
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(size.height * 0.01),
                              child: InputTextForm(
                                formValidator: context
                                    .read<ChangePasswordempCubit>()
                                    .newpasswordValidator,
                                prefIcon: Icons.password,
                                hintText: 'Enter your  New Password',
                                iconData: Icons.password,
                                onChange: () {},
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(size.height * 0.01),
                              child: InputTextForm(
                                formValidator: context
                                    .read<ChangePasswordempCubit>()
                                    .confirmpasswordValidator,
                                prefixIcon: Icons.password,
                                prefIcon: Icons.password,
                                hintText: 'Confirm your New Password',
                                iconData: Icons.password,
                                onChange: () {},
                              ),
                            ),
                             state is ChangepasswordAwaitState
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  :ElevatedBtn(
                              buttonText: "ChangePassword ",
                              onPressed: () {
                                 if (context
                                                .read<ChangePasswordempCubit>()
                                                .newpasswordValidator
                                                .controller
                                                .text !=
                                            context
                                                .read<ChangePasswordempCubit>()
                                                .confirmpasswordValidator
                                                .controller
                                                .text) {
                                          AppConstants.showToast(context,
                                              'password and confirmed not match');
                                        } else if (context
                                            .read<ChangePasswordempCubit>()
                                            .confirmpasswordValidator
                                            .controller
                                            .text
                                            .isEmpty) {
                                          AppConstants.showToast(context,
                                              ' confirm password is Empty ');
                                        } else if (context
                                            .read<ChangePasswordempCubit>()
                                            .newpasswordValidator
                                            .controller
                                            .text
                                            .isEmpty) {
                                          AppConstants.showToast(
                                              context, 'New password is Empty');
                                        } else if (context
                                            .read<ChangePasswordempCubit>()
                                            .passwordValidator
                                            .controller
                                            .text
                                            .isEmpty) {
                                          AppConstants.showToast(
                                              context, 'Old password is Empty');
                                        } else {
                                          context
                                              .read<ChangePasswordempCubit>()
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
