
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/ChangePasswordempcubit/change_passwordemp_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
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
                                  .confirmpasswordValidator,
                              prefixIcon: Icons.password,
                              prefIcon: Icons.password,
                              hintText: 'Confirm Password',
                              iconData: Icons.password,
                              onChange: () {},
                            ),
                          ),
                          ElevatedBtn(
                            buttonText: "ChangePassword ",
                            onPressed: () {},
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
