package cn.jeeweb.modules.test.db;

import cn.jeeweb.modules.leave.entity.UserLeave;
import cn.jeeweb.modules.sys.entity.User;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 * Created by Chao.Cui.VWED on 2018/8/30.
 */
public class Test {
    private static SqlSessionFactory sqlSessionFactory;
    private static Reader reader;

    public static void main(String[] args) {
//        // 数据源配置
//        DataSourceConfig dsc = new DataSourceConfig();
//        dsc.setDbType(DbType.SQL_SERVER);
//
//        dsc.setDriverName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        dsc.setUsername("root");
//        dsc.setPassword("root");
//        dsc.setUrl("jdbc:sqlserver://localhost:1433;DatabaseName=MoMo");
////        mpg.setDataSource(dsc);
        try {
            reader = Resources.getResourceAsReader("opc-db-conf.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Test test = new Test();
        test.getUserByID("0e7de93348ca428f8ae95b537bedc398");

    }



    public static SqlSessionFactory getSession() {
        return sqlSessionFactory;
    }

    public void getUserByID(String userID) {
            SqlSession session = sqlSessionFactory.openSession();
            try {
                UserLeaveMapper userOperation = session
                        .getMapper(UserLeaveMapper.class);
                UserLeave user = userOperation.selectUserByID(userID);
                if (user != null) {
//                    System.out.println(user.getId() + ":" + user.getUserName()
//                            + ":" + user.getUserAddress());
                }

            } finally {
                session.close();
            }
        }

}
