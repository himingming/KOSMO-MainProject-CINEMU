package movie.pak.controller.movie;

import java.text.SimpleDateFormat;
import java.time.DateTimeException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.movie.MovieBuyDAOInter;
import movie.pak.dto.DateDTO;
import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.SeatAddDTO;
import movie.pak.dto.TheaterDTO;
import movie.pak.dto.TicketaddDTO;

@Controller
@RequestMapping(value = "/ticket")
public class MovieBuyController {

   @Autowired
   private MovieBuyDAOInter movieBuyDAOInter;

   //지선님: ateamproject/ticket/movieName -> moviebuyform
      //심소님이랑 나 : projectRv/ticket/movResv
      @RequestMapping(value = "/movResv")
      public ModelAndView movResv() {
         List<MovieUpDTO> list = movieBuyDAOInter.movieName();
         ModelAndView mav = new ModelAndView("movie/resvSelectForm");
         mav.addObject("list",list);

         /* 상영관 리스트
         List<TheaterDTO> theaterlist = movieBuyDAOInter.theaterName();
         mav.addObject("theaterlist", theaterlist);
         */
         // 시간, 날짜 뽑기
         SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy,MM,dd,HH,mm");
         String[] nowTime = sdf1.format(new Date()).split(",");
         int year = Integer.parseInt(nowTime[0]);
         int month = Integer.parseInt(nowTime[1]);
         int preday = Integer.parseInt(nowTime[2]) - 1;

         Calendar cal = Calendar.getInstance();
         cal.set(year, month - 2, preday); // month 변수는 0부터 시작하므로 1을 빼줍니다.
         int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

         List<DateDTO> dayWeekList = new ArrayList<DateDTO>();
         String strMonth = "";
         int cnt = 0;
         for (int i = 1; i < 15; i++) {
             DateDTO dto = new DateDTO();
             int nextMonthDay = preday + i;
             int nextMonth = month;
             if (nextMonthDay > lastDay) {
                 cnt++;
                 nextMonth++;
                 if (nextMonth > 12) {
                     year++;
                     nextMonth = 1;
                 }
                 nextMonthDay = 1;
             } else if (nextMonthDay < 1) {
                 cnt--;
                 nextMonth--;
                 if (nextMonth < 1) {
                     year--;
                     nextMonth = 12;
                 }
                 nextMonthDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
             }
             dto.setYear(Integer.toString(year));
             if (nextMonth < 10) {
                 strMonth = "0" + Integer.toString(nextMonth);
             } else {
                 strMonth = Integer.toString(nextMonth);
             }
             dto.setMonth(strMonth);
             dto.setDay(Integer.toString(nextMonthDay));
             LocalDate date = LocalDate.of(year, nextMonth, nextMonthDay);
             DayOfWeek dayOfWeek = date.getDayOfWeek();
             dto.setDayOfweek(dayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN).substring(0, 1));
             dayWeekList.add(dto);
}

      mav.addObject("dayWeekList", dayWeekList);

      List<String> timeList = new ArrayList<String>();
      String strI = "";
      for (int i = 0; i < 10; i++) {
         strI = Integer.toString(i);
         if (i < 10) {
            strI = "0" + strI;
         }
         timeList.add(strI);
      }
      mav.addObject("timeList", timeList);

      return mav;
   }
   // ------------------★상영시간표---------------------------------------
      @RequestMapping(value = "/timetable")
      public ModelAndView timeTable() {
         List<TheaterDTO> splist = movieBuyDAOInter.sPlaceList();
         ModelAndView mav = new ModelAndView("movie/timetable");
         mav.addObject("splist", splist);

         // 영화 이름 리스트
         // List<MovieUpDTO> namelist = movieBuyDAOInter.movieName();
         // 상영관 리스트
         List<TheaterDTO> theaterlist = movieBuyDAOInter.theaterName();
         mav.addObject("theaterlist", theaterlist);

         // 시간, 날짜 뽑기
         SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy,MM,dd,HH,mm");

         String[] nowTime = sdf1.format(new Date()).split(",");
         int year = Integer.parseInt(nowTime[0]);
         int month = Integer.parseInt(nowTime[1]);
         int preday = Integer.parseInt(nowTime[2]);

         Calendar cal = Calendar.getInstance();
         cal.set(year, month-1, preday);
         int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

         List<DateDTO> dayWeekList = new ArrayList<DateDTO>();
         String strMonth = "";
         int cnt = 0;
         for (int i = 0; i < 15; i++) {
            DateDTO dto = new DateDTO();
            if ((preday + i - 2) >= lastDay) {
               cnt++;
               int nextMonthDay = 0;

               if (month == 12) {
                  year++;
                  month = 0;

               }
               dto.setYear(Integer.toString(year));

               if ((month + 1) < 10) {
                  strMonth = "0" + Integer.toString(month + 1);
               }
               dto.setMonth(strMonth);
               dto.setDay(Integer.toString(nextMonthDay + cnt));

               LocalDate date = LocalDate.of(year, month + 1, nextMonthDay + cnt);
               DayOfWeek dayOfWeek = date.getDayOfWeek();
               dto.setDayOfweek(dayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN).substring(0, 1));
               dayWeekList.add(dto);

               continue;
            }
            dto.setYear(Integer.toString(year));

            if ((month) < 10) {
               strMonth = "0" + Integer.toString(month);
            }

            dto.setMonth(strMonth);
            dto.setDay(Integer.toString(preday + i));

             try {
                     LocalDate date = LocalDate.of(year, month, preday + i);
                     DayOfWeek dayOfWeek = date.getDayOfWeek();
                     dto.setDayOfweek(dayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN).substring(0, 1));
                     dayWeekList.add(dto);
                 } catch (DateTimeException e) {
                     // Invalid value for DayOfMonth 에러 처리
                     continue;
                 }
             }

         mav.addObject("dayWeekList", dayWeekList);

         List<String> timeList = new ArrayList<String>();
         String strI = "";
         for (int i = 0; i < 10; i++) {
            strI = Integer.toString(i);
            if (i < 10) {
               strI = "0" + strI;
            }
            timeList.add(strI);
         }
         mav.addObject("timeList", timeList);

         return mav;
      }
      //결제완료 했을 때 결제 --> 결제완료로 넘어갈 때
      @RequestMapping("/ticketComplate")
      public ModelAndView ticketComplate(TicketaddDTO ttvo, SeatAddDTO saddvo, MovieBuyDTO mbvo) {
    	  ModelAndView mav = new ModelAndView("movie/paySuccess");
          mav.addObject("ticket", ttvo);
          mav.addObject("svokey", saddvo);
          mav.addObject("success", mbvo);
          return mav;
	}
}