# elbara_express_delivery_man

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers https://github.com/AhmedLSayed9/deliverzler tutorials,
samples, guidance on mobile development, and a full API reference.


Logique métier
L'application peut être utilisée par plusieurs chauffeurs-livreurs dans le restaurant. Vous pouvez également le faire fonctionner pour les applications multi-fournisseurs.
Uniquement écran de connexion pour l'employé. Vous devez les autoriser dans le backend par une application d'administration.
L'écran d'accueil affichera le flux des commandes de livraison prêtes à être livrées upcomingou en cours de livraison onTheWay.
Tout employé peut voir les détails de la commande et livrer upcomingles commandes.
L'employé peut livrer plusieurs commandes.
Seul l'employé qui livre la commande peut confirmer/annuler ou afficher la carte de la commande.
Si le client a fourni sa localisation "dans l'application client", elle sera chargée sur la carte, sinon l'employé pourra rechercher la localisation (nouveau jeton de session utilisé pour chaque session de recherche afin de réduire la facture Google Maps).
Lorsque la commande arrivera à destination à (200 mètres), l'employé responsable de la commande recevra une notification locale et pourra confirmer et appeler le client sur la carte.
Si l'emplacement du chauffeur-livreur a changé avec les deux (changement de distance de 5 secondes et 50 mètres), il mettra à jour le géoPoint de livraison sur le backend (pour toutes ses commandes de livraison actuelles, afin que les clients puissent l'écouter) et mettra à jour les directions de la carte (pour seulement la carte ouverte, le cas échéant).
Lorsqu'une nouvelle commande est ajoutée au backend (bon de livraison). Tous les employés recevront une notification de FCM (fonctionne avec l'application au premier plan, en arrière-plan ou terminée).
L'employé peut ajouter/modifier ses informations sur l'écran de profil.