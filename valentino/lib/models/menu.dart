class Menu{
  final String title, image;
  final double price;

  Menu({required this.title, required this.image, required this.price,
  });
}


class CategoryMenu{
  final String category;
  final List<Menu> items;
  CategoryMenu({required this.category, required this.items
  });
}
final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu(category: "Холодные закуски", items: [
    Menu(title: "Название блюда", image: "assets/VB.png", price: 400),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 400),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 400), 

  ]),
   CategoryMenu(category: "Салаты", items: [
  Menu(title: "Название блюда", image: "assets/VB.png", price: 700),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 700),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 700), 
  ]),
  CategoryMenu(category: "Пинца", items: [
     Menu(title: "Название блюда", image: "assets/VB.png", price: 900),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 900),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 900), 
  ]),
  CategoryMenu(category: " Паста", items: [
  Menu(title: "Название блюда", image: "assets/VB.png", price: 100),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 100),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 100), 
  ]),
  CategoryMenu(category: " Гарнир", items: [
  Menu(title: "Название блюда", image: "assets/VB.png", price: 300),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 300),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 300), 
  ]),
  CategoryMenu(category: " Десерты", items: [
  Menu(title: "Название блюда", image: "assets/VB.png", price: 1000),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 1000),
   Menu(title: "Название блюда", image: "assets/VB.png", price: 1000), 
  ]),
];