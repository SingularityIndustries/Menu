#include <iostream>
#include <cstdlib>
#include <iomanip>

using namespace std;

int main()
{
	int makeChoice;

		do
		{
			cout << "Welcome to the Main Menu\n";
			cout << "(1.) Encryption/Decryption of a file\n";
			cout << "(2.) SSH menu\n";
			cout << "(3.) Reconnaissance (NMAP)\n";
			cout << "(4.) Parsing Fields of a Dump\n";
			cout << "(5.) System Information\n";
			cout << "(6.) Forensic Scripts\n";
			cout << "(7.) Exploitation Menu\n";
			cout << "(8.) Post Exploitation Menu\n";
			cout << "(9.) Firewll (IP Tables)\n";
			cout << "(10.) Exit Menu\n";

			cin >> makeChoice;

		} while (true);

		switch (makeChoice)
		{
		case 1:
			//making selection for 1
			break;
		case 2:
			//making selection for 2
			break;
		case 3:
			//making selection for 3
			break;
		case 4:
			//making selection for 4
			break;
		case 5:
			//making selection for 5
			break;
		case 6:
			//making selection for 6
			break;
		case 7:
			//making selection for 7
			break;
		case 8:
			//making selection for 8
			break;
		case 9:
			//making selection for 9
			break;
		case 10:
			cout << "Exit";
			break;

		default:
			cout << "Not a valid selection";
			break;
		}

		while (makeChoice != 10);
		return 0;


}

