package database;

import org.springframework.jdbc.core.JdbcTemplate;
import util.AppContextHolder;

import java.io.*;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class password {

    public static boolean insert(String id, String text) {
        boolean back = false;
        String newtext = text;
        ArrayList cardlist = new ArrayList();
        ArrayList passlist = new ArrayList();
        byte[] newbyte = newtext.getBytes();
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(newbyte)));
            String str = "";
            while ((str = br.readLine()) != null) {
                writeComLog(str, PropertyUtils.getPropertyUtils().getProperty("insertpassword"));
                if (str.indexOf(",") > 0) {
                    cardlist.add(str.substring(0, str.indexOf(",")).trim());
                    passlist.add(str.substring(str.indexOf(",") + 1).trim());
                } else {
                    writeComLog(str, PropertyUtils.getPropertyUtils().getProperty("passworderror"));
                }
            }
            back = insertsql(id, cardlist, passlist);
            return back;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return back;
    }

    public static boolean insertsql(String id, ArrayList idlist, ArrayList nameList) {
        boolean back = false;
        JdbcTemplate jdbcTemplate = AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class);
        String sql;
        try {
            for (int i = 0; i < idlist.size(); ++i) {
                sql = "insert into ivr_nine_password(passwordtypeid,cardnum,password) values('" + id + "','" + idlist.get(i) + "','" + nameList.get(i) + "');";
                jdbcTemplate.execute(sql);
            }
            return true;
        } catch (Exception e) {
            back = false;
            e.printStackTrace();
        }

        return back;
    }

    public static void writeComLog(String str, String filename) {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        try {
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
