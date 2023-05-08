import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CustomListViewModel extends Equatable {
  final String name;
  final String logo;
  final double amount;
  bool isFavorite;
  CustomListViewModel({
    required this.name,
    required this.logo,
    required this.amount,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [name, logo, amount, isFavorite];

  @override
  String toString() =>
      'CustomListViewModel(name: $name, logo: $logo, amount: $amount, isFavorite:$isFavorite)';

  String getPriceWithFormat() {
    var f = NumberFormat.currency(locale: 'es', symbol: 'MX\$');
    return f
        .format(amount)
        .replaceAll('.', '|')
        .replaceAll(',', '.')
        .replaceAll('|', ',');
  }

  CustomListViewModel copyWith({
    String? name,
    String? logo,
    double? amount,
    bool? isFavorite,
  }) {
    return CustomListViewModel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      amount: amount ?? this.amount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  CustomListViewModel updateWith({
    String? name,
    String? logo,
    double? amount,
    bool? isFavorite,
  }) {
    return CustomListViewModel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      amount: amount ?? this.amount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
