#include<stdio.h>
#define NN 255
#define KK 239
#define TT 16
#define PRIM 0X87
#define GF 0x80
#define MASK 0xff
#define PRIM_ELE 11
int main()
{
    FILE *fp2,*fp1; 
	int lamdash[TT-1]={0},i,j,check=0,errorat[TT]={0},ch=0,temp,er[TT],temp1=1,temp2,ch1 ;
    int s[TT]={0};
    int k=1,l=0,c[TT-1]={0},lam[TT-1]={0},e,invof[NN+1],lamnew[TT-1],omg[TT-1],omgcorr,lamdash_corr,crtd,crt;
    int g[TT]={120,63,172,19,132,6,224,138,156,136,65,115,53,11,10,167};
	int indexof[NN+1],alf[NN+1],multi[NN+1][NN+1];
    int rec[NN];
	
	fp1=fopen("rcvd_255,239.txt","r");

	for(i=0;i<NN;i++)
		fscanf(fp1,"%d\n",&rec[i]);
	
	fclose(fp1);

	printf("Received Message\n");

	for(i=0;i<255;i++)
		printf("%d ",rec[i]);

	c[TT-3]=1;
	lam[TT-2]=1;
	
	alf[0]=1;
	for(i=0;i<NN;i++)
    {
		alf[i]=alf[i]&MASK;
        indexof[alf[i]]=i;
        if((alf[i]&GF)==GF)
			alf[i+1]=(alf[i]<<1)^PRIM;
        else
			alf[i+1]=alf[i]<<1;
    }
    indexof[0]=-1;
     
	for(i=0;i<=NN;i++)
		for(j=0;j<=NN;j++)
		{
			if(i==0||j==0)
				multi[i][j]=0;
            else
				multi[i][j]=alf[(indexof[i]+indexof[j])%NN];
		}

     //inverse
    for(i=2;i<=NN;i++)
		invof[i]=alf[NN-indexof[i]];

    invof[0]=0;
    invof[1]=1;

	for(i=0;i<TT;i++)
		for(j=0;j<NN;j++)
			s[i]=rec[j]^multi[s[i]][g[i]];
    
    do
    {
		e=s[k-1];
        
		for(i=1;i<=l;i++)
			e^=multi[lam[TT-2-i]][s[k-i-1]];

        for(i=0;i<TT-1;i++)
			lamnew[i]=(multi[e][c[i]])^lam[i];
		
		if(e!=0)
		{
			if(2*l<k)
            {
				l=(k-l);
                
				for(i=0;i<TT-1;i++)
					c[i]=multi[invof[e]][lam[i]];
            }
		}
        
		for(i=1;i<TT-1;i++)
			c[i-1]=c[i];
        
		c[TT-2]=0;

        for(i=0;i<TT-1;i++)
			lam[i]=lamnew[i];

        k++;
      }while(k<=TT);
      
	for(k=TT-1;k>=0;k--)
	{
		omg[k]=0;
		
		for(j=TT-2,i=k;j>=0 && i>=0;i--,j--)
			omg[k]^=multi[s[i]][lam[j]];
    }
	ch=0;
	for(i=NN-1;i>=0;i--)
	{
		check=0;
        
		for(j=0;j<TT-1;j++)
			check^=multi[lam[(j)]][alf[((TT-2-j)*(NN-i))%NN]];
        
		if(check==0)
        {
			er[ch]=i;
            printf("error_loc_poly_root %d = %d\n",ch, er[ch]);
			ch++;

		}
		
	}
ch=0;

	for(i=NN-1;i>=0;i--)
	{
		check=0;
        
		for(j=0;j<TT-1;j++)
			check^=multi[lam[(j)]][alf[((TT-2-j)*(NN-i)*PRIM_ELE)%NN]];
        
		if(check==0)
        {
			errorat[ch]=i;
            printf("ERROR@%d = %d\n",ch, errorat[ch]);
			ch++;

		}
		
	}
			
    for(i=0;i<(TT-1)/2;i++)
    {
		temp=lam[i];
        lam[i]=lam[TT-2-i];
        lam[TT-2-i]=temp;
    }

    for(i=1;i<TT-1;i=i+2)
		lamdash[(i-1)]=lam[i];
      
	  ch1=ch;
	for(i=0;i<(TT-1)&&i<ch1;i++)
    {
		crt=0;crtd=0;omgcorr=0;lamdash_corr=0;
        for(j=0;j<TT-1;j++)
			omgcorr^=multi[omg[j]][alf[j*(NN-er[i])%NN]];
                      
		for(j=0;j<TT-1;j++)
			lamdash_corr^=multi[lamdash[j]][alf[j*(NN-er[i])%NN]];

        crt=multi[omgcorr][invof[lamdash_corr]];
        temp1=1;          
		for(j=0;j<119;j++)//til b-1=120-1
			temp1=multi[temp1][alf[er[i]]];
		temp2=invof[temp1];
		crtd=multi[crt][temp2];

		//printf("%d\n",crtd);
        rec[NN-1-errorat[i]]^=crtd;
    }

    //printf("Corrected output is in crtd_out_255,239.txt\n");
	  
	fp2=fopen("crtd_out_255,239.txt","w");

	for(i=0;i<NN;i++)
		fprintf(fp2,"%d\n",rec[i]);

	fclose(fp2);

	printf("\n\n");
	
	printf("Corrected output\n");
	for(i=0;i<255;i++)
		printf("%d ",rec[i]);

	getch();

}
