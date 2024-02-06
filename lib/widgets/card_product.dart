//  import '../core.dart';

// InkWell cardProduct({
//     required BuildContext context,
//     required int index,
//     required ModelProduct state,
//     required void Function() onTap,
//   }) {
//     final dataProduct = state.data[index];
//     return InkWell(
//       onTap: onTap,
//       child: GridTile(
//         header: GridTileBar(
//           title: Text('$index', style: const TextStyle(color: Colors.black)),
//         ),
//         child: Container(
//           margin: const EdgeInsets.all(12.0),
//           padding: const EdgeInsets.all(12.0),
//           decoration: ShapeDecoration(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             gradient: RadialGradient(
//               colors: [
//                 // context.colorScheme.background,
//                 context.colorScheme.primary,
//                 context.colorScheme.background,
//               ],
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 child: Image.network(
//                   dataProduct.image,
//                   height: context.height * 0.17,
//                   width: context.height * 0.17,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const Gap(4),
//               Text(
//                 dataProduct.name,
//                 style: context.textTheme.titleMedium,
//               ),
//               const Text('1kg'),
//               Text(
//                 'Rp. ${dataProduct.price}',
//                 style: context.labelMediumBold,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
