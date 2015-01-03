package database;

import org.springframework.jdbc.core.JdbcTemplate;
import util.AppContextHolder;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

public class pingbi {

    public static Hashtable getpingbi(String id, String text) {
        String newtext = text;
        ArrayList pingbilist = new ArrayList();
        ArrayList weilist = new ArrayList();
        ArrayList arrayList = getzifulist();
        Hashtable hashtable = new Hashtable();
        byte[] newbyte = newtext.getBytes();
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(newbyte)));
            String str = "";
            while ((str = br.readLine()) != null) {
                writeComLog(str, PropertyUtils.getPropertyUtils().getProperty("pingbi"));
                if (str == null)
                    continue;
                boolean ispingbi = zifu(str, arrayList);
                if (ispingbi) {
                    pingbilist.add(str);
                } else weilist.add(str);

            }

            hashtable.put("pingbi", pingbilist);
            hashtable.put("wei", weilist);

            return hashtable;
        } catch (Exception e) {
            e.printStackTrace();
            writeComLog(e.getMessage(), PropertyUtils.getPropertyUtils().getProperty("pingbierror"));
        }

        return hashtable;
    }

    public static ArrayList getzifulist() {
        String sql = null;
        ArrayList arrayList = new ArrayList();
        try {
            sql = "SELECT zifu  from ivr_minganzifu;";

            JdbcTemplate jdbcTemplate = AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class);
            List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
            if(list != null && list.size() > 0){
                for(Map<String, Object> rs : list){
                    arrayList.add(rs.get("zifu").toString());
                }
            }
            return arrayList;
        } catch (Exception e) {
            writeComLog(e.getMessage(), PropertyUtils.getPropertyUtils().getProperty("pingbierror"));
            e.printStackTrace();
        }

        return arrayList;
    }

    public static boolean zifu(String text, ArrayList zifulist) {
        boolean back = false;
        try {
            for (int i = 0; i < zifulist.size(); ++i) {
                if (!(text.contains(zifulist.get(i).toString())))
                    continue;
                back = true;
            }

        } catch (Exception e) {
            writeComLog(e.getMessage(), PropertyUtils.getPropertyUtils().getProperty("pingbierror"));
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
            writeComLog(e.getMessage(), PropertyUtils.getPropertyUtils().getProperty("pingbierror"));
            e.printStackTrace();
        }
    }


}
