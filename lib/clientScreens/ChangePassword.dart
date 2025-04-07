
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/ChangePasswordcubit/change_password_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
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
        listener: (context, state) {},
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
                      Column(
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
                                  .confirmpasswordValidator,
                              prefixIcon: Icons.password,
                              prefIcon: Icons.password,
                              hintText: 'Confirm Password',
                              iconData: Icons.password,
                              onChange: () {},
                            ),
                          ),
                             ElevatedBtn(
                              //minWidth: 200.0,
                              //minHeight: 20.0,
                              buttonText: "ChangePassword ",
                              onPressed: () {
                              },
                              backgroundColor: kbutton,
                              textColor: Kbackground,
                            ),
                        ],
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