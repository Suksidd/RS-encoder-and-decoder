#include<stdio.h>
#define nn 255
#define kk 239
#define tt 16
void mul(unsigned char acc0);

unsigned char gx[]={1,165,105,27,159,104,152,101,76,101,152,104,159,27,105,165,1};

unsigned char a0=0x00;
unsigned char a1=0x00;
unsigned char a2=0x00;
unsigned char a3=0x00;
unsigned char a4=0x00;
unsigned char a5=0x00;
unsigned char a6=0x00;
unsigned char a7=0x00;

unsigned char o1=0x00;
unsigned char o2=0x00;
unsigned char o0=0x00;
unsigned char o3=0x00;
unsigned char o4=0x00;
unsigned char o5=0x00;
unsigned char o6=0x00;
unsigned char o7=0x00;

unsigned char o_1=0x00;

unsigned char o_101=0x00;
unsigned char o_104=0x00;
unsigned char o_105=0x00;
unsigned char o_152=0x00;
unsigned char o_159=0x00;
unsigned char o_165=0x00;
unsigned char o_27=0x00;
unsigned char o_76=0x00;

unsigned char buf[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
unsigned char acc[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int main()
{
int i,j,k,x=0;int z =0;int loop,loop1,buff;
unsigned char mx[nn];

FILE *in=fopen("inFile.txt","r");
FILE *out=fopen("outFile.txt","w");

	for(loop1=0;loop1<nn;loop1++)

	{	
		
		fscanf(in,"%d\n",&buff);
		mx[loop1]=buff;
		if(loop1<kk)
			fprintf(out,"%d\n",buff);
	
	}



/*for(i=0;i<kk;i++)
{
mx[i]=i+1;

}

for(i=kk;i<nn;i++)
{
mx[i]=0x00;

}

*/

	for(z=0;z<kk;z++)
	{
		
		acc[0]=acc[0]^mx[x];
		mul(acc[0]);
		for(j=0;j<tt-1;j++)
		{
		buf[j]=buf[j]^acc[j+1];
		}
		x++;
		for(k=0;k<tt;k++)
		{
		acc[k]=buf[k];
		}

	
	}
	

	printf("\n the parity is \n");
	for(j=0;j<tt;j++)
	{
		fprintf(out,"%d\n",buf[j]);
		printf("%d\n",buf[j]);
	}


	return 0;

}



void mul(unsigned char acc0)

{
a0=acc0&0x01;
a1=(acc0&0x02)>>1;
a2=(acc0&0x04)>>2;
a3=(acc0&0x08)>>3;
a4=(acc0&0x10)>>4;
a5=(acc0&0x20)>>5;
a6=(acc0&0x40)>>6;
a7=(acc0&0x80)>>7;




//multiple 1


o0=a0;
o1=a1;
o2=a2;
o3=a3;
o4=a4;
o5=a5;
o6=a6;
o7=a7;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_1=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x27

o0=a0^a4^a7;
o1=a0^a1^a4^a5^a7;
o2=a2^a1^a4^a5^a6^a7;
o3=a3^a0^a2^a6^a5^a7;
o4=a4^a6^a0^a7^a1^a3;
o5=a5^a1^a2^a4^a7;
o6=a2^a3^a5^a6;
o7=a3^a6;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_27=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x76


o0=a2^a4^a7^a3;
o1=a2^a5^a7^a0;
o2=a1^a2^a4^a6^a7;
o3=a2^a0^a5^a3^a7;
o4=a1^a6^a3^a4;
o5=a2^a4^a5^a7;
o6=a0^a3^a5^a6;
o7=a1^a6^a2^a3;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_76=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x101


o0=a2^a0^a7^a6;
o1=a1^a2^a3^a6;
o2=a0^a3^a4^a6;
o3=a1^a4^a5^a7;
o4=a2^a6^a5;
o5=a0^a3^a6^a7;
o6=a0^a1^a4^a7;
o7=a1^a5^a6^a7;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_101=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x104


o0=a2^a5^a7^a6;
o1=a2^a3^a5;
o2=a2^a3^a4^a5^a7;
o3=a0^a4^a5^a3^a6;
o4=a1^a6^a5^a4^a7;
o5=a0^a2^a5^a6^a7;
o6=a0^a1^a3^a6^a7;
o7=a1^a5^a6^a4;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_104=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x105


o0=a0^a2^a5^a7^a6;
o1=a1^a2^a3^a5;
o2=a3^a4^a5^a7;
o3=a0^a4^a5^a6;
o4=a1^a6^a5^a7;
o5=a0^a2^a6^a7;
o6=a0^a1^a3^a7;
o7=a1^a4^a6^a5^a7;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_105=o0^o1^o2^o3^o4^o5^o6^o7;



//multiple x152


o0=a1^a2^a5^a3^a6;
o1=a1^a4^a7^a5;
o2=a3^a1;
o3=a0^a2^a4;
o4=a1^a0^a5^a3;
o5=a1^a2^a6^a4;
o6=a2^a5^a3^a7;
o7=a0^a1^a4^a2^a5;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_152=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x159


o0=a0^a2^a5^a3^a1;
o1=a0^a4^a6^a5;
o2=a0^a2^a6^a7^a3;
o3=a0^a1^a3^a7^a4;
o4=a1^a0^a5^a2^a4;
o5=a1^a2^a6^a3^a5;
o6=a2^a4^a3^a6^a7;
o7=a0^a4^a2^a7^a1;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_159=o0^o1^o2^o3^o4^o5^o6^o7;


//multiple x165


o0=a0^a2^a1^a6;
o1=a3^a6^a7;
o2=a0^a1^a2^a6^a4^a7;
o3=a2^a1^a3^a7^a5;
o4=a3^a6^a2^a4;
o5=a0^a4^a7^a3^a5;
o6=a1^a4^a5^a6;
o7=a0^a1^a5^a7;


o1=o1<<1;o2=o2<<2;o3=o3<<3;o4=o4<<4;o5=o5<<5;o6=o6<<6;o7=o7<<7;

o_165=o0^o1^o2^o3^o4^o5^o6^o7;



buf[0]=o_165;
buf[1]=o_105;
buf[2]=o_27;
buf[3]=o_159;
buf[4]=o_104;
buf[5]=o_152;
buf[6]=o_101;
buf[7]=o_76;
buf[8]=o_101;
buf[9]=o_152;
buf[10]=o_104;
buf[11]=o_159;
buf[12]=o_27;
buf[13]=o_105;
buf[14]=o_165;
buf[15]=o_1;

}



