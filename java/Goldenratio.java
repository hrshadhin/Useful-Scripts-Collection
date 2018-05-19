
package goldenratio;


public class Goldenratio {

    
    public static void main(String[] args) {
        System.out.println("The Golden Ratio. ");
        long  i=0,j=1,k=0,l;
        System.out.printf("%d,%d",i,j);
        for(l=0;l<100;l++){
            
            System.out.printf(",%d",k=i+j);
            i=j;
            j=k;
        }
        System.out.println("........");
        
      
    }
}
