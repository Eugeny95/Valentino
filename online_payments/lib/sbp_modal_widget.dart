// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sbp/data/c2bmembers_data.dart';
// import 'package:sbp/models/c2bmembers_model.dart';
// import 'package:sbp/sbp.dart';


// class SbpHeaderModalSheet extends StatelessWidget {
//   const SbpHeaderModalSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         Container(
//           height: 5,
//           width: 50,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//         Image.asset(
//           'packages/sbp/assets/sbp.png',
//           width: 100,
//         ),
//         const SizedBox(height: 10),
//         const Text('Выберите банк для оплаты по СБП'),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }

// class SbpModalBottomSheetEmptyListBankWidget extends StatelessWidget {
//   const SbpModalBottomSheetEmptyListBankWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SbpHeaderModalSheet(),
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Container(
//               height: 80,
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//               child: const Center(
//                 child: Text('У вас нет банков для оплаты по СБП'),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 50),
//       ],
//     );
//   }
// }

// /// Модальное окно с банками
// class SbpModalBottomSheetWidget extends StatelessWidget {
//   final List<C2bmemberModel> informations;
//   final String url;

//   const SbpModalBottomSheetWidget(this.informations, this.url, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     /// если есть информация о банках, то отображаем их
//     if (informations.isNotEmpty) {
//       return Column(
//         children: [
//           const SbpHeaderModalSheet(),
//           Expanded(
//             child: ListView.separated(
//               itemCount: informations.length,
//               itemBuilder: (ctx, index) {
//                 final information = informations[index];
//                 return Container(
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(179, 109, 109, 109),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   child: GestureDetector(
//                     onTap: () => openBank(url, information),
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 10),
//                         SizedBox(
//                           width: 60.0,
//                           height: 60.0,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20.0),
//                             child: information.bitmap != null
//                                 ? Image.memory(
//                                     information.bitmap!,
//                                   )
//                                 : information.icon.isNotEmpty
//                                     ? Image.asset(
//                                         information.icon,
//                                       )
//                                     : Image.network(
//                                         information.logoURL,
//                                       ),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Center(
//                           child: Text(information.bankName),
//                         ),
//                         const SizedBox(width: 10)
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       );
//     } else {
//       return const SbpModalBottomSheetEmptyListBankWidget();
//     }
//   }

//   /// передается scheme
//   FutureOr<void> openBank(String url, C2bmemberModel c2bmemberModel) async => await Sbp.openBank(url, c2bmemberModel);
// }