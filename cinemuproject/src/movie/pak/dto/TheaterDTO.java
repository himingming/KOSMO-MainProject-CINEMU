package movie.pak.dto;

public class TheaterDTO {
   // 수정완료
 private int theater_id;
 private String theater_name;
 private int theater_no;
 
public int getTheater_id() {
   return theater_id;
}
public void setTheater_id(int theater_id) {
   this.theater_id = theater_id;
}
public String getTheater_name() {
   return theater_name;
}
public void setTheater_name(String theater_name) {
   this.theater_name = theater_name;
}
public int getTheater_no() {
   return theater_no;
}
public void setTheater_no(int theater_no) {
   this.theater_no = theater_no;
}
}