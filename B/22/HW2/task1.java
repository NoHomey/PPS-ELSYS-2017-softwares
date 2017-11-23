package demo;
import java.util.*;

import java.nio.file.*;

public class Main {

	public static void main(String[] args) {
		//int col1=0;
	//	int help1=0;
		
		try{
			List<String> lines1 = Files.readAllLines(Paths.get("matrix1.csv"));	
			List<String> lines2 = Files.readAllLines(Paths.get("matrix2.csv"));	
			//List<String> lines2 = Files.readAllLines(Paths.get("src\\data\\matrix1.csv"));			
			//smenete si papkata v proekta;
			List<List<Integer>> l1 = new ArrayList<>();
			List<List<Integer>> l2 = new ArrayList<>();
			List<List<Integer>> rl = new ArrayList<>();
			
			
			

			
			
			if(l1.size()!=l2.size()){
				System.out.println("undefined");
				return;
			}
	
			else{
				for(int i=0; i<l1.size()-1; i++){
					if(l1.get(i).size()!=l2.get(i).size()){
						System.out.println("undefined");
						return;
					}				
				}
				   for(int i = 0; i < l1.size(); i++) {
		                if(l1.get(i).size() != l2.get(i).size()) {
		                    return;
		                }
		            }	
				
			}
			
			for(String line: lines1){

				String []result = line.split(",");
				List<Integer> row = new ArrayList<>();
				
				for(String s: result)
					row.add(Integer.parseInt(s));
				
				//System.out.println(row);
				l1.add(row);
					//System.out.println(l1);
				//edin list ot list ot integeri koito shte bude rezultata i posle s 2 cikula ediniq shte bude za samiq list ot listove a drugiq shte bude za vutreshnite listove koito sa ot integeri;
			}
			
			
			for(String line: lines2){
				
			//	line = line.replace("\"" ,"");
				//lines2.get(0).replace(" ", "");
				String []result = line.split(",");
				List<Integer> row2 = new ArrayList<>();
				
				for(String s2: result)
					row2.add(Integer.parseInt(s2));
				
				//System.out.println(row);
				l2.add(row2);
					//System.out.println(l2);
				//edin list ot list ot integeri koito shte bude rezultata i posle s 2 cikula ediniq shte bude za samiq list ot listove a drugiq shte bude za vutreshnite listove koito sa ot integeri;
			}
			
					
			if(l1.size()!=l2.size()){
				System.out.println("undefined");
				return;
			}
	
			else{
				for(int i=0; i<l1.size()-1; i++){
					if(l1.get(i).size()!=l2.get(i).size()){
						System.out.println("undefined");
						return;
					}				
				}
				   for(int i = 0; i < l1.size(); i++) {
		                if(l1.get(i).size() != l2.get(i).size()) {
							System.out.println("undefined");
		                    return;
		                }
		            }	
				
			}
			
				
			for(int j=0; j<l1.size(); j++){
				List<Integer> row3 = new ArrayList<>();
				
				for(int count=0; count<l1.get(0).size(); count++){
					row3.add(l1.get(j).get(count)+l2.get(j).get(count));
					
				}
				//System.out.println(row3);
				rl.add(row3);
				System.out.println(rl);
				

			}	
			
			
			
			
			
			
		}	catch (Exception e){
				System.out.println(e.getMessage());
		}		
	}

}
