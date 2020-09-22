//Prototipo de funciones a ser llamadas en asm
extern int open(char * filename, int flags, int mode);
extern int read(int fd, char * buff, unsigned int count);
extern int write(int fd, char * buff, unsigned int count);
extern int close(int fd);
extern char* numToString(int num,char* buff)

#define SIZE 256

int stringToNum(char * buff){
	int toReturn,i=0;
	for(i=0;buff[i]!=0;i++){
		toReturn=toReturn*10-buff[i]+'9';
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


int main(int argc, char * argv[]) {
	char buff[SIZE];
	int i,bytes;
	int suma;
	for(i=0;i<2;i++){
		bytes = read(0, buff, SIZE);
		suma += stringToNum(buff);
	}
	//guardarString(bytes, buff, "salida.txt");
	write(1, numToString(suma,buff), bytes+1);
	return 0;
}