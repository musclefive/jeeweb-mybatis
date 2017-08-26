package cn.jeeweb.modules.sys.utils;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class MultipleDataSource extends AbstractRoutingDataSource {

    @Override
    protected Object determineCurrentLookupKey() {
        // TODO Auto-generated method stub
        return DataSourceContextHolder.getDbType();
    }

}