package database;

import org.springframework.jdbc.core.JdbcTemplate;
import util.AppContextHolder;

import java.sql.Connection;
import java.sql.SQLException;

public class MysqlConnect {

    public static Connection newConnection()
            throws SQLException {
        return AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class)
                .getDataSource().getConnection();
    }

    public static Connection getConncet()
            throws SQLException {
        return AppContextHolder.getContext().getBean("jdbcTemplate", JdbcTemplate.class)
                .getDataSource().getConnection();
    }
}
