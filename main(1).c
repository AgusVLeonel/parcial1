//Prototipo de funciones a ser llamadas en asm
extern int open(char * filename, int flags, int mode);
extern int read(int fd, char * buff, unsigned int count);
extern int write(int fd, char * buff, unsigned int count);
extern int close(int fd);

#include <stdio.h>

#define SIZE 256

int stringToNum(char * buff){
	int toReturn=0,i=0;
	for(i=0;buff[i]!='\n';i++){
		toReturn=toReturn*10+buff[i]-'0';
	}
	return toReturn;
}
//void numToString(char *buff,int bytes,int num){
//	int i,resto;
//	for(;num>0;num/10){
//		resto=num%10;
//		buffer[i]=
//	}
//}

void guardarString(int bytes, char * buff, char * fileName) {
	int fd = open(fileName, 0x0100, 7);
	write(fd, buff, bytes);
	close(fd);
}

long int suma(int var1, int var2){
	return(long int) var1 + var2;
}

void numToString(long num, char * buffer){
    if (num==0){
      buffer[0] = '0';
      return;
    }
    int i=0;
    int j=0;
    while(num > 0){
        buffer[i++] = num%10 + '0';
        num = num / 10 ;
    }
    char aux; //j apunta al comienzo del buffer, i al final
    buffer[i--]=0;
     while(j<i){
        aux = buffer[i];
        buffer[i] = buffer[j];
        buffer[j]=aux;
        j++;
        i--;
    }
}

int main(int argc, char * argv[]) {
	char buff[SIZE];
	int i,bytes;
	int suma = 0;
	for(i=0;i<2;i++){
		bytes = read(0, buff, SIZE);
		suma += stringToNum(buff);
	}
	//guardarString(bytes, buff, "salida.txt");
	numToString(suma, buff);
	write(1, buff, bytes+1);
	return 0;
}
