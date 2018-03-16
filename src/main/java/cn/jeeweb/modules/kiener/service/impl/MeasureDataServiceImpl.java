package cn.jeeweb.modules.kiener.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.PageImpl;
import cn.jeeweb.core.query.data.Pageable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.parse.QueryToWrapper;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.mapper.MeasureDataMapper;
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Transactional
@Service("measureDataService")
public class MeasureDataServiceImpl extends CommonServiceImpl<MeasureDataMapper,MeasureData> implements IMeasureDataService{

    /*
    * select all counts with no pages
    * */
    @Override
    public List<MeasureData> selectTakeTimePage(Queryable queryable, Wrapper<MeasureData> wrapper) {
//        wrapper.eq("1", "1");
        List<MeasureData> records = baseMapper.selectTakeTime(queryable, wrapper);
        return records;
    }

    @Override
    public List<MeasureData> queryOutput(Queryable queryable, Wrapper<MeasureData> wrapper) {
//        wrapper.eq("1", "1");
        List<MeasureData> records = baseMapper.queryRealTimeOutput(queryable, wrapper);
        return records;
    }

    /*
    * 联合表MeasurementGeneralTemp 获取每个岗位的换型次数
    * */
    @Override
    public List<MeasureData> queryOutputChangeType(Queryable queryable, Wrapper<MeasureData> wrapper) {
//        wrapper.eq("1", "1");
        List<MeasureData> records = baseMapper.queryRealTimeOutputChangeType(queryable, wrapper);
        return records;
    }

    /*
    * query the real time takt time for key stations
    * */
    @Override
    public List<MeasureData> queryTaktTime(Queryable queryable, Wrapper<MeasureData> wrapper, Wrapper<MeasureData> wrapper_1){
        List<MeasureData> records = baseMapper.queryRealTimeTaktTime(queryable, wrapper, wrapper_1);
        return records;
    }

    /*
    * query the real time takt time for single station
    * */
    @Override
    public List<MeasureData> querySingleTaktTime(Wrapper<MeasureData> wrapper){
        List<MeasureData> records = baseMapper.queryRealTimeTaktTimeSingle(wrapper);
        return records;
    }

    /*
    * query the zkg id list
    * */
    @Override
    public List<MeasureData> queryZKGDMC(Queryable queryable, Wrapper<MeasureData> wrapper, Wrapper<MeasureData> wrapper_1 ){
        List<MeasureData> records = baseMapper.queryZKGDMCbm(queryable, wrapper, wrapper_1);
        return records;
    }

    /*
    * query the  dmc  list by single DMC code
    * */
    @Override
    public List<MeasureData> querySingleDMC(Queryable queryable, Wrapper<MeasureData> wrapper ){
        List<MeasureData> records = baseMapper.querySingleDMCbm(queryable, wrapper);
        return records;
    }

    /*
    * query the DMC code from the table[DMCMeasureDailyData]
    * to show the daily zkg output group by zk/zk/kw type
    * */
    @Override
    public List<MeasureData> queryDailyDMC(Queryable queryable, Wrapper<MeasureData> wrapper ){
        List<MeasureData> records = baseMapper.queryDailyDMCbm(queryable, wrapper);
        return records;
    }

    /*
    * query the DMC code from the table[DMCMeasureDailyData]
    * to show the daily zk/zkg/kw output group by zk/zk/kw type
    * */
    @Override
    public List<MeasureData> queryDailyDMCforZK(Queryable queryable, Wrapper<MeasureData> wrapper ){
        List<MeasureData> records = baseMapper.queryDailyDMCbmforZK(queryable, wrapper);
        return records;
    }

    /*
    * query the ZK and KW id list
    * */
    @Override
    public List<MeasureData> queryZKGAndKWDMC(Queryable queryable, Wrapper<MeasureData> wrapper,Wrapper<MeasureData> wrapper_1){
        List<MeasureData> records = baseMapper.queryZKAndKWDMCbm(queryable, wrapper, wrapper_1);
        return records;
    }

    /*
    * query the leak test for a list or chart
    * */
    @Override
    public List<MeasureData> queryLeakTest(Wrapper<MeasureData> wrapper){
        List<MeasureData> records = baseMapper.queryLeasTestbm(wrapper);
        return records;
    }

    /*
    * query the screw data for a list or chart
    * */
    @Override
    public List<MeasureData> queryScrweList(Queryable queryable, Wrapper<MeasureData> wrapper){
        List<MeasureData> records = baseMapper.queryScrewListbm(queryable,wrapper);
        return records;
    }


    /*
    * query the Engine List from the MeasureGeneralData Table
    * */
    @Override
    public List<MeasureData> queryEngineList(Queryable queryable, Wrapper<MeasureData> wrapper ){
        List<MeasureData> records = baseMapper.queryEngineList(queryable, wrapper);
        return records;
    }


    /*
    *
    * */
    public Page<MeasureData> listWithSQL(Queryable queryable, Wrapper<MeasureData> wrapper){
        QueryToWrapper<MeasureData> queryToWrapper = new QueryToWrapper<MeasureData>();
        queryToWrapper.parseCondition(wrapper, queryable);
        // 排序问题
        queryToWrapper.parseSort(wrapper, queryable);
        Pageable pageable = queryable.getPageable();
        com.baomidou.mybatisplus.plugins.Page<MeasureData> page = new com.baomidou.mybatisplus.plugins.Page<MeasureData>(
                pageable.getPageNumber(), pageable.getPageSize());
        com.baomidou.mybatisplus.plugins.Page<MeasureData> content = selectPageForMeasure(page, wrapper);

        return new PageImpl<MeasureData>(content.getRecords(), queryable.getPageable(), content.getTotal());
    }

    public com.baomidou.mybatisplus.plugins.Page<MeasureData> selectPageForMeasure(com.baomidou.mybatisplus.plugins.Page<MeasureData> page, Wrapper<MeasureData> wrapper) {
        SqlHelper.fillWrapper(page, wrapper);
        page.setRecords(baseMapper.selectTakeTimePage(page, wrapper));

        return page;
    }

}
