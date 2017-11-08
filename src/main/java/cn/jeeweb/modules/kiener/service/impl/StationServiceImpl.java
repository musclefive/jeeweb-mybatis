package cn.jeeweb.modules.kiener.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.Station;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.kiener.mapper.StationMapper;
import cn.jeeweb.modules.kiener.mapper.TakeTimeMapper;
import cn.jeeweb.modules.kiener.service.IStationService;
import cn.jeeweb.modules.kiener.service.ITakeTimeService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Transactional
@Service("stationService")
public class StationServiceImpl extends CommonServiceImpl<StationMapper,Station> implements IStationService{


}
