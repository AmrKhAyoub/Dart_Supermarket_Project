import 'dart:io';
import 'functions.dart';
import 'databases.dart;
void main() {
  print("--------------------------------");
  print("---------SUPERMARKET SYSTEM----------");
  int? id;
  do {
    print("----------------");
    print("Are You A User or A Manager ?");
    print("1- User.");
    print("2- Manager.");
    print("3- Finish.");
    print("----------------");
    print("You Are A :");
    id = int.parse(stdin.readLineSync()!);
    switch (id) {
      //USER
      case 1:
        {
          user();
          userOptions();
          int? userChoice;
          do {
            print("----------------");
            print("Your Choice of Options :");
            userChoice = int.parse(stdin.readLineSync()!);
            switch (userChoice) {
              //PRINT MENU
              case 1:
                {
                  print("----------------");
                  print("MENU :");
                  printMenu();
                }
                break;
              //PRINT CART
              case 2:
                {
                  print("----------------");
                  print("YOUR CART IS :");
                  printCart();
                }
                break;
              //BUY PRODUCT
              case 3:
                {
                  print("----------------");
                  print("BUY A PRODUCT :");
                  addToCart();
                }
                break;
              //RETURN PAGE
              case 4:
                {}
                break;
              //FINISH
              case 5:
                {
                  print("----------------");
                  print("----------------");
                  print("Thnx for using our Supermarket ^_^ !");
                  print("----------------");
                  print("----------------");
                  return;
                }

              default:
                {
                  print("----------------");
                  print("Out of Range ! Try Again !");
                }
            }
          } while (userChoice != 4);
        }
        break;

      //MANAGER
      case 2:
        {
          manager();
          int? managerChoice;

        //  do 
        //  {
            print("----------------");
            print("Your Choice of Options :");
            managerChoice = int.parse(stdin.readLineSync()!);
            switch (managerChoice) 
            {
              //LOGIN
              case 1:
              {
                print("----------------");
                print("LOGIN :");
                login();
              }
              break;
              //SIGN UP
              case 2:
              {
                print("----------------");
                print("SIGN UP :");
                signup(); 
              }
              break;
              //
              case 3:
              {
                print("-------------------------------------");
                print("Thnx for using our Supermarket ^_^ !");
                print("-------------------------------------");

              }
              break;
              default:
              {
                print("----------------");
                print("Out of Range ! Try Again !");
              }
            }
        //  } while (managerChoice != 4);
          managerOptions();
          do {
            print("----------------");
            print("Your Choice of Options :");
            managerChoice = int.parse(stdin.readLineSync()!);
            switch (managerChoice) {
              //MENU
              case 1:
                {
                  print("----------------");
                  print("MENU :");
                  printMenu();
                }
                break;
              //ADD NEW PRODUCT
              case 2:
                {
                  print("----------------");
                  print("ADD NEW PRODUCT :");
                  addNewProduct();
                }
                break;
              //EDIT PRICE
              case 3:
                {
                  print("----------------");
                  print("EDIT PRICE :");
                  updatePrice();
                }
                break;
              //RETURN A PAGE
              case 4:
                {}
                break;
              //FINISH
              case 5:
                {
                  print("-------------------------------------");
                  print("Thnx for using our Supermarket ^_^ !");
                  print("-------------------------------------");
                  return;
                }
            
              default:
                {
                  print("----------------");
                  print("Out of Range ! Try Again !");
                }
            }
          } while (managerChoice != 4);
        }
        break;
      //FINISH
      case 3:
        {
          print("-------------------------------------");
          print("Thnx for using our Supermarket ^_^ !");
          print("-------------------------------------");
        }
        break;

      default:
        {
          print("----------------");
          print("Out of Range ! Try Again !");
        }
      break;
    }
  } while (id != 3);
} //MAIN FUCNCTOIN
