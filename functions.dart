import 'dart:io';
import 'databases.dart';

extension MyFun on Map
{
  void add(dynamic key,dynamic value)
  {
    this[key]=value;
  }
  dynamic indexElement(int index)
  {
    int i=1;
    for (var element in this.keys) {
      if (i==index)
        return element;
      i += 1;
    }
  }
}
//LOGIC MANAGER
bool isManger(String name,String password)
{
  if (managers.containsKey(name))
  {
    return managers[name] == password;
  }
  return false;
}

void login()
{
  print("----------------");
  print("Enter your Name :");
  String? managerName = stdin.readLineSync();
  print("Enter your Password :");
  String? managerPassword = stdin.readLineSync();
  if (isManger(managerName!, managerPassword!))
  {
  print("----------------");
  print("Welcome Manager $managerName !! What do you want to do ?");
  }
  else
  {
    print("Wrong Data ! Try Again !");
    login();
  }
}

void signup()
{
  print("----------------");
  print("Enter your Name :");
  String? managerName = stdin.readLineSync();
  print("Enter your Password :");
  String? managerPassword = stdin.readLineSync();
  managers.add(managerName!,managerPassword!);
  print("----------------");
  print("Welcome Manager $managerName !! Your profile has been added !!");
  print("You Can Do This :");
}
 
void addNewProduct()
{
  print("----------------");
  print("Enter product name :");
  String? productName = stdin.readLineSync();
  print("Enter product price :");
  int? productPrice = int.parse(stdin.readLineSync()!);
  menu.add(productName!, productPrice);
}

void updatePrice()
{
  print("----------------");
  print("Enter number of your product :");
  int? index = int.parse(stdin.readLineSync()!);
  String productName = menu.indexElement(index);
  if (menu.containsKey(productName))
  {
    print("Update price to :");
    int? newPrice = int.parse(stdin.readLineSync()!);
    menu.add(productName, newPrice);
  }
  else
  {
    print("Error In Product ! Try Again");
    updatePrice();
  }

}

//LOGIC USER
void addToCart() 
{
  print("----------------");
  print("Enter number of your product OR Zero to stop :");
  int? index = int.parse(stdin.readLineSync()!);
  if (index != 0 && index<=menu.length)
  { 
    String product = menu.indexElement(index);
    int price = menu[product]!;
    if (cart.containsKey(product)) 
    {
      price += cart[product]!;
    }
    cart.add(product,price);
    addToCart();
  }
  else
  {
    return;
  }
}

// DISPLAY MANAGER
void manager()
{
  print("----------------");
  print("Hello Manager ! Please Log In or Sign Up !");
  print("1- Login.");
  print("2- Sign Up.");
  print("3- Finish Programme.");
}

void managerOptions()
{
  print("----------------");
  print("What you can do as a Manager :");
  print("1- Show Menu.");
  print("2- Add New Product.");
  print("3- Edit Product Price.");
  print("4- Return Page.");
  print("5- Close Programme.");
}

//DISPLAY USER
void user()
{
  print("Enter your name :");
  String? userName = stdin.readLineSync();
  print("----------------");
  print("Welcome $userName !! What do you want to do ?");
  //userOptions();
}

void userOptions() {
  print("----------------"); 
  print("1- Show Menu.");
  print("2- Show Your Cart.");
  print("3- Buy a Product.");
  print("4- Return Page.");
  print("5- Finish Programme.");
  print("----------------"); 

}

void printMenu()
 {
  var i = 1;
  print("----------------");
  for (var element in menu.keys) {
    print("$i- $element ${menu[element]} SDG");
    i++;
  }
  print("----------------");
 }

void printCart()
{
  if (cart.isEmpty)
  {
    print("You bought nothing and your cost is 0 ");
  }
  else 
  {
    var i = 1;
    var total = 0;
    print("----------------");
    for (var element in cart.keys) {
      print("$i- $element ${cart[element]} SDG");
      total += cart[element]!;
      i++;
    }
    print("----------------");
    print("Total cost is $total SDG");
    print("----------------");
  }
}


void main(List<String> args) {
  addToCart();
  printCart();
}
