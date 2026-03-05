import 'dart:ui';

class CakeCategory {
  final String name;
  final String icon;
  final Color color;
  final List<Cake> cakes;

  CakeCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.cakes,
  });

}

class Cake {
  final String name;
  final String description;
  final String price;
  final bool isPopular;

  Cake({
    required this.name,
    required this.description,
    required this.price,
    this.isPopular = false,
  });
}

final List<CakeCategory> categories = [
  CakeCategory(
    name: 'Bánh Chocolate',
    icon: '🍫',
    color: Color(0xFF8B4513),
    cakes: [
      Cake(
        name: 'Bánh Chocolate Đậm Đà',
        description: 'Bánh chocolate nguyên chất, lớp kem socola béo ngậy',
        price: '250.000đ',
        isPopular: true,
      ),
      Cake(
        name: 'Bánh Chocolate Sữa',
        description: 'Bánh chocolate kết hợp sữa tươi thơm ngon',
        price: '220.000đ',
      ),
      Cake(
        name: 'Bánh Chocolate Hạt Dẻ',
        description: 'Bánh chocolate với hạt dẻ giòn tan',
        price: '280.000đ',
        isPopular: true,
      ),
    ],
  ),
  CakeCategory(
    name: 'Bánh Kem Sữa',
    icon: '🥛',
    color: Color(0xFFDEB887),
    cakes: [
      Cake(
        name: 'Bánh Kem Sữa Tươi',
        description: 'Bánh bông lan mềm với lớp kem sữa tươi',
        price: '200.000đ',
        isPopular: true,
      ),
      Cake(
        name: 'Bánh Kem Dâu Tây',
        description: 'Kem sữa kết hợp dâu tây tươi',
        price: '230.000đ',
      ),
      Cake(
        name: 'Bánh Kem Trái Cây',
        description: 'Bánh kem sữa với nhiều loại trái cây',
        price: '260.000đ',
      ),
    ],
  ),
  CakeCategory(
    name: 'Kem Lạnh',
    icon: '🍦',
    color: Color(0xFF87CEEB),
    cakes: [
      Cake(
        name: 'Kem Chocolate',
        description: 'Kem chocolate mát lạnh, đậm vị',
        price: '45.000đ',
        isPopular: true,
      ),
      Cake(
        name: 'Kem Vani',
        description: 'Kem vani truyền thống thơm ngon',
        price: '40.000đ',
      ),
      Cake(
        name: 'Kem Dâu Tây',
        description: 'Kem dâu tây chua ngọt',
        price: '45.000đ',
      ),
      Cake(
        name: 'Kem Socola Bạc Hà',
        description: 'Kem socola kết hợp bạc hà mát lạnh',
        price: '50.000đ',
        isPopular: true,
      ),
    ],
  ),
];