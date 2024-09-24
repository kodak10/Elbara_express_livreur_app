import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../domain/order.dart';
import 'package:http/http.dart' as http;

String? orderStatus;

class OrderDetailsDialog extends StatelessWidget {
  const OrderDetailsDialog({
    required this.order,
    super.key,
  });
  final AppOrder order;

  void initState() {
    fetchOrderStatus();
  }

  Future<void> fetchOrderStatus() async {
    final url =
        Uri.parse('https://app.paydunya.com/api/v1/dmp-api/check-status');
    final headers = {
      'Content-Type': 'application/json',
      'PAYDUNYA-MASTER-KEY': 'fhRrUGWg-Upkg-0r3x-Z7DI-d8fR0aIHgxc2',
      'PAYDUNYA-PRIVATE-KEY': 'live_private_tvQxERrcZFOVXgpi3NyUckcWDDL',
      'PAYDUNYA-TOKEN': 'vI7BDJAJvpWDY8Y4rjBL',
    };

    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("orders")
        .doc(order
            .id) // Utilisation de l'ID de la commande pour obtenir le document
        .get();

    final String paymentRef =
        snapshot.get('paymentRef'); // Extrait la valeur du champ paymentRef

    final body = jsonEncode({'reference_number': paymentRef});

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      orderStatus = responseData['status'];

      print('order: $orderStatus');
      print('order: $order');
    } else {
      print('response: $response');
      // Gérer les erreurs ici, par exemple afficher un message d'erreur à l'utilisateur
      print(
          'Erreur lors de la récupération du statut de la commande: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: Sizes.dialogWidth280,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${tr(context).orderDetails}:',
                style: TextStyles.f18SemiBold(context)
                    .copyWith(decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: Sizes.marginV8,
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.marginV16,
          ),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: QrImageView(
                  data: order.paymentUrl,
                  //data: order.id,

                  // ignore: deprecated_member_use
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(
                width: Sizes.marginH12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                          '${tr(context).id}:',
                          style: TextStyles.f16(context),
                        ),
                        Flexible(
                          child: Text(
                            '${order.orderId.substring(0, 11)}',
                            style: TextStyles.f16(context),
                          ),
                        ),
                    Text(
                          '${tr(context).payment}:',
                          style: TextStyles.f16(context),
                        ),
                        Flexible(
                          child: orderStatus != null
                              ? Text(
                                  orderStatus == "canceled"
                                      ? "Annulé"
                                      : orderStatus == "pending"
                                          ? "En attente"
                                          : orderStatus == "completed"
                                              ? "Payer"
                                              : "Erreur",
                                  style: TextStyle(
                                    color: orderStatus == "canceled"
                                        ? Colors.black38
                                        : orderStatus == "pending"
                                            ? Colors.deepOrange
                                            : orderStatus == "completed"
                                                ? Colors.deepPurpleAccent
                                                : Colors.yellowAccent,
                                  ),
                                )
                              : CircularProgressIndicator(),
                        ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.marginV16,
          ),
          Text(
            '${tr(context).userDetails}:',
            style: TextStyles.f18SemiBold(context)
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: Sizes.paddingH14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                 Text(
              order.lieuDepart.isEmpty ? tr(context).none : order.lieuDepart,
              style: TextStyles.f16(context),
            ),
            Text(
              order.lieuArrivee.isEmpty ? tr(context).none : order.lieuArrivee,
              style: TextStyles.f16(context),
            ),
               
                Text(
                  order.address!.mobile,
                  style: TextStyles.f16(context),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Sizes.marginV16,
          ),
          Text(
            '${tr(context).note}:',
            style: TextStyles.f18SemiBold(context)
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: Sizes.paddingH14),
            child: Text(
              order.userNote.isEmpty ? tr(context).none : order.userNote,
              style: TextStyles.f16(context),
            ),
          ),
        ],
      ),
    );
  }
}
