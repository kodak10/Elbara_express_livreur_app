import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_objects.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    //required String state,
    //required String city,
    //required String street,
    required String mobile,
    required GeoPoint? geoPoint,
  }) = _Address;
}

@JsonEnum(valueField: 'jsonValue')
enum PickupOption {
  delivery('delivery'), //livraison
  pickUp('pickUp'), //ramasser
  diningRoom('diningRoom'); //salle à manger

  const PickupOption(this.jsonValue);

  final String jsonValue;
}

@JsonEnum(valueField: 'jsonValue')
enum DeliveryStatus {
  pending('pending'), //en attente
  upcoming('upcoming'), //A venir
  onTheWay('onTheWay'), //en chemin
  delivered('delivered'), //livré
  canceled('canceled'); //annulé

  const DeliveryStatus(this.jsonValue);

  final String jsonValue;
}
