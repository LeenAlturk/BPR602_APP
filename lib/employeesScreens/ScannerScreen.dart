

// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Cubits/QrCubit/qrcubit_cubit.dart';
// import 'package:bpr602_cinema/employeesScreens/Scaninfo.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class Scanner extends StatelessWidget {
//   const Scanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Kbackground,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor:Kbackground,
//          automaticallyImplyLeading: false,
//         title: const Text(
//           'Scan QR Code',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: BlocProvider(
//         create: (context) => QrcubitCubit(),
//         child: BlocConsumer<QrcubitCubit, QrcubitState>(
//           listener: (context, state) {
//             if (state is QRScannerSuccess) {
//               // ScaffoldMessenger.of(context).showSnackBar(
//               //   SnackBar(content: Text('QR Code Scanned: ${state.qrCode}')),
//               // );
//               NavigationWidget.pushPage(context, Scaninfo(result: state.qrCode,));
//             }
//           },
//           builder: (context, state) {
//             return Column(
//               children: <Widget>[
//                 Expanded(
//                   flex: 3,
//                   child: MobileScanner(
//                     onDetect: (barcodeCapture) {
//                       final barcodes = barcodeCapture.barcodes;
//                       for (final barcode in barcodes) {
//                         if (barcode.rawValue != null) {
//                           final qrCode = barcode.rawValue!;
//                           context.read<QrcubitCubit>().onQRCodeScanned(qrCode);
//                           break; // Stop after the first detected QR code
//                         }
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Cubits/QrCubit/qrcubit_cubit.dart';
// import 'package:bpr602_cinema/employeesScreens/Scaninfo.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class Scanner extends StatelessWidget {
//   const Scanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Kbackground,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor:Kbackground,
//          automaticallyImplyLeading: false,
//         title: const Text(
//           'Scan QR Code',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: BlocProvider(
//         create: (context) => QrcubitCubit(),
//         child: BlocConsumer<QrcubitCubit, QrcubitState>(
//           listener: (context, state) {
//             if (state is QRScannerSuccess) {
//               // ScaffoldMessenger.of(context).showSnackBar(
//               //   SnackBar(content: Text('QR Code Scanned: ${state.qrCode}')),
//               // );
//               NavigationWidget.pushPage(context, Scaninfo(result: state.qrCode,));
//             }
//           },
//           builder: (context, state) {
//             return Column(
//               children: <Widget>[
//                 Expanded(
//                   flex: 3,
//                   child: MobileScanner(
//                     onDetect: (barcodeCapture) {
//                       final barcodes = barcodeCapture.barcodes;
//                       for (final barcode in barcodes) {
//                         if (barcode.rawValue != null) {
//                           final qrCode = barcode.rawValue!;
//                           context.read<QrcubitCubit>().onQRCodeScanned(qrCode);
//                           break; // Stop after the first detected QR code
//                         }
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/QrCubit/qrcubit_cubit.dart';
import 'package:bpr602_cinema/employeesScreens/Scaninfo.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Kbackground,
        automaticallyImplyLeading: false,
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) => QrcubitCubit(),
        child: BlocConsumer<QrcubitCubit, QrcubitState>(
          listener: (context, state) {
            if (state is QRScannerSuccess) {
              // Navigate to ScanInfo screen and disable scanning
              NavigationWidget.pushPage(
                context,
                Scaninfo(result: state.qrCode),
              ).then((_) {
                // Reset scanner state when returning to this page
                context.read<QrcubitCubit>().resetScanner();
              });
            }
          },
          builder: (context, state) {
            final canScan = context.watch<QrcubitCubit>().canScan;
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: MobileScanner(
                    
                    fit: BoxFit.contain,
                    onDetect: (barcodeCapture) {
                      if (!canScan) return; // Prevent scanning if disabled
                      final barcodes = barcodeCapture.barcodes;
                      for (final barcode in barcodes) {
                        if (barcode.rawValue != null) {
                          final qrCode = barcode.rawValue!;
                          context.read<QrcubitCubit>().onQRCodeScanned(qrCode);
                          break; // Stop after the first detected QR code
                        }
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

