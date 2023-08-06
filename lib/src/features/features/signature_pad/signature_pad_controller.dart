import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePadController extends GetxController {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey<SfSignaturePadState>();

  Future<void> saveSignature() async {
    try {
      // Get the signature image as a data URI (base64 string)
      final signatureData = await signaturePadKey.currentState?.toImage(pixelRatio: 3.0);

      // Convert the data URI to Uint8List (bytes)
      final ByteData? byteData = await signatureData!.toByteData(format: ImageByteFormat.png);
      final Uint8List bytes = byteData!.buffer.asUint8List();

      // Save the signature image to the device's gallery
      final result = await ImageGallerySaver.saveImage(bytes);

      if (result['isSuccess']) {
        // Signature saved successfully
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       title: Text('Signature Saved'),
        //       content: Text('The signature has been saved to your gallery.'),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //           child: Text('OK'),
        //         ),
        //       ],
        //     );
        //   },
        // );
      } else {
        // Failed to save the signature
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       title: Text('Error'),
        //       content: Text('Failed to save the signature.'),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //           child: Text('OK'),
        //         ),
        //       ],
        //     );
        //   },
        // );
      }
    } catch (e) {
      // Handle any errors that might occur during the saving process
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: Text('Error'),
      //       content: Text('An error occurred while saving the signature.'),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }
}
