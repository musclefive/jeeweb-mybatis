package cn.jeeweb.modules.kiener.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.entity.StationScrew;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface IStationScrewService extends ICommonService<StationScrew> {

    public List<StationScrew> selectScrewStation(Queryable queryable, Wrapper<StationScrew> wrapper);

}
