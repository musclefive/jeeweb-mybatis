package cn.jeeweb.modules.kiener.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.PageImpl;
import cn.jeeweb.core.query.data.Pageable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.parse.QueryToWrapper;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.kiener.mapper.MeasureDataMapper;
import cn.jeeweb.modules.kiener.mapper.TakeTimeMapper;
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import cn.jeeweb.modules.kiener.service.ITakeTimeService;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Transactional
@Service("takeTimeService")
public class TakeTimeServiceImpl extends CommonServiceImpl<TakeTimeMapper,TakeTime> implements ITakeTimeService{


}