import 'dart:convert';
import 'package:equatable/equatable.dart';

class CoinModel extends Equatable {
  const CoinModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.price,
    required this.priceBtc,
    required this.volume,
    required this.marketCap,
    required this.availableSupply,
    required this.totalSupply,
    required this.priceChange1H,
    required this.priceChange1D,
    required this.priceChange1W,
    required this.websiteUrl,
    required this.twitterUrl,
    required this.exp,
  });

  final int rank;
  final int totalSupply;
  final int availableSupply;

  final String id;
  final String icon;
  final String name;
  final String symbol;
  final double price;
  final double priceBtc;
  final double volume;
  final double marketCap;
  final double priceChange1H;
  final double priceChange1D;
  final double priceChange1W;
  final String websiteUrl;
  final String twitterUrl;
  final List<String> exp;

  @override
  List<Object> get props {
    return [
      id,
      icon,
      name,
      symbol,
      rank,
      price,
      priceBtc,
      volume,
      marketCap,
      availableSupply,
      totalSupply,
      priceChange1H,
      priceChange1D,
      priceChange1W,
      websiteUrl,
      twitterUrl,
      exp,
    ];
  }

  @override
  String toString() {
    return 'CoinModel(id: $id, icon: $icon, name: $name, symbol: $symbol, rank: $rank, price: $price, priceBtc: $priceBtc, volume: $volume, marketCap: $marketCap, availableSupply: $availableSupply, totalSupply: $totalSupply, priceChange1H: $priceChange1H, priceChange1D: $priceChange1D, priceChange1W: $priceChange1W, websiteUrl: $websiteUrl, twitterUrl: $twitterUrl, exp: $exp)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'icon': icon});
    result.addAll({'name': name});
    result.addAll({'symbol': symbol});
    result.addAll({'rank': rank});
    result.addAll({'price': price});
    result.addAll({'priceBtc': priceBtc});
    result.addAll({'volume': volume});
    result.addAll({'marketCap': marketCap});
    result.addAll({'availableSupply': availableSupply});
    result.addAll({'totalSupply': totalSupply});
    result.addAll({'priceChange1H': priceChange1H});
    result.addAll({'priceChange1D': priceChange1D});
    result.addAll({'priceChange1W': priceChange1W});
    result.addAll({'websiteUrl': websiteUrl});
    result.addAll({'twitterUrl': twitterUrl});
    result.addAll({'exp': exp});

    return result;
  }

  factory CoinModel.fromMap(Map<String, dynamic> json) {
    return CoinModel(
      id: json["id"],
      icon: json["icon"] ?? '',
      name: json["name"] ?? '',
      symbol: json["symbol"] ?? '',
      rank: json["rank"] ?? 0,
      price: json["price"] == null ? 0.0 : json["price"] + .0,
      priceBtc: json["priceBtc"] == null ? 0.0 : json["priceBtc"] + .0,
      volume: json["volume"] == null ? 0.0 : json["volume"] + .0,
      marketCap: json["marketCap"] == null ? 0.0 : json["marketCap"] + .0,
      availableSupply: json["availableSupply"] ?? 0,
      totalSupply: json["totalSupply"] ?? 0,
      priceChange1H: json["priceChange1h"]?.toDouble(),
      priceChange1D: json["priceChange1d"]?.toDouble(),
      priceChange1W: json["priceChange1w"]?.toDouble(),
      websiteUrl: json["websiteUrl"] ?? '',
      twitterUrl: json["twitterUrl"] ?? '',
      exp: json["exp"] == null
          ? []
          : List<String>.from(json["exp"].map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinModel.fromJson(String source) =>
      CoinModel.fromMap(json.decode(source));
}
