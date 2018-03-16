package cn.jeeweb.modules.kiener.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.Station;
import cn.jeeweb.modules.kiener.entity.StationScrew;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.kiener.mapper.StationMapper;
import cn.jeeweb.modules.kiener.mapper.StationScrewMapper;
import cn.jeeweb.modules.kiener.service.IStationScrewService;
import cn.jeeweb.modules.kiener.service.IStationService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Transactional
@Service("stationScrewService")
public class StationScrewServiceImpl extends CommonServiceImpl<StationScrewMapper,StationScrew> implements IStationScrewService{

    /*
        * select all the employee efficent from TafOK table
        * */
    @Override
    public List<StationScrew> selectScrewStation(Queryable queryable, Wrapper<StationScrew> wrapper){
        List<StationScrew> records = baseMapper.selectScrewStation(queryable, wrapper);
        return records;

    }
}
