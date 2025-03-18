// sleep milisekund moje
#include <iostream>
#include <windows.h> // pro funkci delay();

char *endptr;

int main(int argc, char **argv) {	
	if (argc == 1 ){
		std::cout<<"SleepMs.exe 200 - ceka 0.2 vteriny"<<std::endl;
		std::cout<<"SleepMs.exe 3500 - ceka 3.5 vteriny, atd."<<std::endl;
		exit(1);
	}

int delay = strtol(argv[1], &endptr,10 );
if (endptr == argv[1]){
std::cerr<<"invalid number "<<argv[1]<<std::endl;
exit(1);
}else if (*endptr){
std::cerr<<"Trailing characters after number: "<<argv[1]<<std::endl;
exit(1);
}else if (errno == ERANGE){
std::cerr<<"Number out of range: "<<argv[1]<<std::endl;
exit(1);
}

// Sleep(delay*1000); puvodni, zadavalo se v jednotkach vterin
Sleep(delay); // zadava se v milisekundach, Sleep musi bejt z velkym "S" takto jak to je
   return 0;
}

