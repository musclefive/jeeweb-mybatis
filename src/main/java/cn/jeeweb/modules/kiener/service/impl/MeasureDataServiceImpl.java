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
