class snacks {
  final String snackimg, title, describtion;
   int price;
  bool isAdd;
  int quantity;
String size; // Add size property
int? variantId;

  snacks({
    required this.snackimg,
    required this.title,
    required this.price,
    required this.describtion,
  
    this.isAdd = false, // Set default to false
    this.quantity = 1,
    this.size = "M", // Default size
    this.variantId,

  });
  snacks copyWith({
  String? snackimg,
  String? title,
  String? describtion,
  int? price,
  int? variantId,
  bool? isAdd,
  int? quantity,
  String? size,
}) {
  return snacks(
    snackimg: snackimg ?? this.snackimg,
    title: title ?? this.title,
    describtion: describtion ?? this.describtion,
    price: price ?? this.price,
    variantId: variantId ?? this.variantId,
    isAdd: isAdd ?? this.isAdd,
    quantity: quantity ?? this.quantity,
    size: size ?? this.size,
  );
}
}

// List<snacks> snack = [
//   snacks(
//     describtion:
//         "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters . It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share ",
//     snackimg:
//         'https://m.caloriebase.com/p/9/3/9/1133939_cinema_city_popcorn__big.png',
//     title: 'popcorn',
//     price: 50,
//   ),
//   snacks(
//     describtion:
//         "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters . It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share ",
//     snackimg:
//         'https://pbs.twimg.com/media/E6Zx776XoAM-1i5?format=jpg&name=4096x4096',
//     title: 'Nachose',
//     price: 50,
//   ),
//   snacks(
//     describtion:
//         "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters . It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share ",
//     snackimg:
//         'https://www.recipetineats.com/uploads/2017/07/Chicken-Burgers-4.jpg',
//     title: 'CHECKEN BURGER',
//     price: 100,
//   ),
//   snacks(
//     describtion:
//         "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters . It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share ",
//     snackimg:
//         'https://embed.widencdn.net/img/beef/1akcqwmdqs/1120x840px/classic-beef-cheeseburgers-horizontal.tif?keep=c&u=7fueml',
//     title: 'Beef BURGER',
//     price: 100,
//   ),
//   snacks(
//     describtion:
//         "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters . It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share ",
//     snackimg:
//         'https://img.freepik.com/premium-photo/watermelon-juice-takeaway-cup-perfect-go-refreshment_1170794-177079.jpg',
//     title: 'juise',
//     price: 50,
//   ),
//   snacks(
//     describtion:
//         "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters . It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share ",
//     snackimg:
//         'https://img.freepik.com/premium-psd/take-away-paper-coffee-cup-mockup_149660-716.jpg',
//     title: 'Arabica Coffe ',
//     price: 50,
//   ),
// ];
