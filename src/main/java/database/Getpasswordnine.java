package database;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import util.AppContextHolder;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class Getpasswordnine {
//    public static String getpassfile = "e:/log/9_ninegetpass.txt";
//    public static String ivrlog = "e:/log/9_nineivrlog.txt";
//    public static String error = "e:/log/9_nineerror.txt";

    private static final Logger log = LoggerFactory.getLogger(Getpasswordnine.class);

    public static String getPass(String phone, String called, String passwordtypeid, String sppassword) {
        String str = null;
        JdbcTemplate jdbcTemplate = AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class);
        try {
            int provinceid = issheng(phone);
            String sql = "select id,cardnum,password from ivr_nine_password where state >0 and passwordtypeid=" +
                    passwordtypeid + " ORDER BY rand() LIMIT 1 ";
            String id = null;

            boolean flag = false; //判断宽畅测试
            if (StringUtils.equals(PropertyUtils.getPropertyUtils().getProperty("kc.passwd"), sppassword)
                    &&
                    PropertyUtils.getPropertyUtils().getProperty("kc.called").indexOf(called) < 0) {
                flag = true;
            }

            if(flag){ //宽畅测试
                sql = "select id,cardnum,password from ivr_nine_password where state = 0 and passwordtypeid=" +
                        passwordtypeid + " and inserttime<'2015-01-01' ORDER BY rand() LIMIT 1 ";
            }

            List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
            if (list != null && list.size() > 0) {
                for (Map<String, Object> rs : list) {
                    id = rs.get("id").toString();
                    str = rs.get("cardnum").toString() + "," + rs.get("password").toString();
                }
            }

            if(flag){ //宽畅测试
                return str;
            }

            if (StringUtils.isNotBlank(id)) {
                sql = "update ivr_nine_password set phone='" + phone +
                        "', callednumber='" + called + "' ,provinceid='" +
                        provinceid +
                        "',inserttime=now()  ,state=0 where  id=" + id;
                jdbcTemplate.execute(sql);
            }

            return str;
        } catch (Exception w) {
            writeComLog(w.getMessage(), PropertyUtils.getPropertyUtils().getProperty("nineerror"));
            w.printStackTrace();
        }
        return str;
    }

    public static long todate(String datetime, String endtime) {
        Date currentTime = new Date();
        long min = 0L;
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = df.parse(datetime);
            Date enddate = df.parse(endtime);
            System.out.println(enddate + "====" + date);

            long l = enddate.getTime() - date.getTime();

            min = l / 1000L;

            return min;
        } catch (Exception w) {
            w.printStackTrace();
        }
        return min;
    }

    public static boolean insertlog(String phone, String called, String starttime, String endtime) {
        String strstart = gettime(starttime);
        String strend = gettime(endtime);
        String fee = String.valueOf((todate(strstart, strend) / 60L + 1L) * 100L);
        int province = issheng(phone);

        try {
            String sql = "insert into ivr_nine_usertj(phone,callednumber,starttime,endtime,fee,provinceid) values('" +
                    phone +
                    "','" +
                    called +
                    "','" +
                    strstart +
                    "','" +
                    strend + "','" + fee + "','" + province + "')";

            JdbcTemplate jdbcTemplate = AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class);
            jdbcTemplate.execute(sql);

            return true;
        } catch (Exception w) {
            writeComLog(w.getMessage(), PropertyUtils.getPropertyUtils().getProperty("nineerror"));
            w.printStackTrace();
        }
        return false;
    }

    public static String gettime(String time) {
        String str = time.substring(0, 4) + "-" + time.substring(4, 6) + "-" +
                time.substring(6, 8) + " " + time.substring(8, 10) + ":" +
                time.substring(10, 12) + ":" + time.substring(12, 14);
        return str;
    }

    public static boolean issp(String called, String sppassword) {
        //宽畅直接放行
        if (StringUtils.equals(sppassword, PropertyUtils.getPropertyUtils().getProperty("kc.passwd"))) {
            return true;
        }

        int num = 0;
        try {
            String sql = "select count(*) from ivr_nine_spnumber where spnumber ='" + called + "' and sppassword='" +
                    sppassword + "' ";
            JdbcTemplate jdbcTemplate = AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class);
            num = jdbcTemplate.queryForInt(sql);

            return num > 0;
        } catch (Exception w) {
            writeComLog(w.getMessage(), PropertyUtils.getPropertyUtils().getProperty("nineerror"));
            w.printStackTrace();
        }
        return false;
    }

    public static int issheng(String phone) {
        Statement pstmt = null;
        ResultSet rst = null;
        Connection conn = null;
        int a = 32;
        try {
            if ((phone == null) || (phone.length() <= 7))
                return 0;
            String hd = phone.substring(0, 7);

            String sql = "select a.id from ivr_province a ,ivr_hd b where b.hd='" + hd + "' and a.province=b.sheng";
            JdbcTemplate jdbcTemplate = AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class);
            List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
            if (list != null & list.size() > 0) {
                for (Map<String, Object> rs : list) {
                    a = Integer.parseInt(rs.get("id").toString());
                }
            }
        } catch (Exception w) {
            writeComLog(w.getMessage(), PropertyUtils.getPropertyUtils().getProperty("nineerror"));
            w.printStackTrace();
        }
        return a;
    }

    public static void main(String[] args) {
        System.out.println("123456".indexOf("23"));
    }

    public static void writeComLog(String str, String filename) {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        try {
            log.info("writeComLog fileName: " + filename);
            File f = new File(filename);
            BufferedWriter bufOut;
            if (f.exists())
                bufOut = new BufferedWriter(new FileWriter(f, true));
            else {
                bufOut = new BufferedWriter(new FileWriter(f));
            }
            bufOut.write(dateString + "-----" + str + "\r\n");
            bufOut.flush();
            bufOut.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
