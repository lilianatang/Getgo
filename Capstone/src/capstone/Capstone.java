/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package capstone;
import java.util.HashMap;
import java.lang.String;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author I72600K
 */
public class Capstone {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        HashMap<String, Integer> Student = new HashMap<>();
        Student.put("English 30-1", 90);
        Student.put("Mathematics 30-1", 71);
        Student.put("Chemistry 30", 69);
        Student.put("Biology 30", 91);
        Student.put("History 30", 90);
        
        ArrayList<ArrayList<String>> Science = new ArrayList<ArrayList<String>>();
        ArrayList<String> cond1 = new ArrayList<>(Arrays.asList("English 30-1"));
        Science.add(cond1);
        ArrayList<String> cond2 = new ArrayList<>(Arrays.asList("Mathematics 30-1"));
        Science.add(cond2);
        ArrayList<String> cond3 = new ArrayList<>(Arrays.asList("Biology 30", "Mathematics 31", "Physics 30", "Chemistry 30"));
        Science.add(cond3);
        ArrayList<String> cond4 = new ArrayList<>(Arrays.asList("Biology 30", "Mathematics 31", "Physics 30", "Chemistry 30"));
        Science.add(cond4);
        ArrayList<String> cond5 = new ArrayList<>(Arrays.asList("History 30", "Drama 30", "Art 30", "French 30", "Spanish 30"));
        Science.add(cond5);
        
        boolean check = checkCourse(Student, Science, 70);
        System.out.print(check);
    }
    
    public static boolean checkCourse (HashMap<String, Integer> student, ArrayList<ArrayList<String>> faculty, int average){
        HashMap<String, Integer> thisStudent = new HashMap<>();
        ArrayList<Integer> courseMarks = new ArrayList<>();
        thisStudent = (HashMap<String, Integer>)student.clone();
        for (ArrayList courseList : faculty) {
            boolean found = false;
            for (Object course : courseList){
                if (thisStudent.get(course) != null){
                    courseMarks.add(thisStudent.get(course));
                    thisStudent.remove(course);
                    found = true;
                    break;
                }
            }
            if(!found){
                return false;
            }
        }
        if(calculateAverage(courseMarks) >= average){
            return true;
        }
        return false;
    }
    
    public static double calculateAverage(ArrayList<Integer> marks){
        int sum = 0;
        if(!marks.isEmpty()){
            for (int mark: marks){
                sum += mark;
            }
            return sum/marks.size();
        }
        return sum;
    }
}
