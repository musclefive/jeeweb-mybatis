package cn.jeeweb.modules.kiener.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.mapper.MeasureDataMapper;
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Transactional
@Service("measureDataService")
public class MeasureDataServiceImpl extends CommonServiceImpl<MeasureDataMapper,MeasureData> implements IMeasureDataService{
}
