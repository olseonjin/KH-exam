package evaluation;

import java.util.Random;
import java.util.Scanner;

public class randomDiv {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int n[][] = new int[3][4];
		Random tr = new Random();
		int sum = 0;
		
		for (int i = 0; i < n.length; i++) {
			for (int j = 0; j < n[i].length; j++) {
				n[i][j]= tr.nextInt(10);
				sum += n[i][j];
			}
		
		}
		System.out.println("생성된 랜덤 숫자들");
		for (int i = 0; i < n.length; i++) {
			for (int j = 0; j < n[i].length; j++) {
				System.out.print(n[i][j] +"\t");
			}
			System.out.println();
		}
		System.out.println("합계:" + sum);
		scanner.close();
	}
	
}
