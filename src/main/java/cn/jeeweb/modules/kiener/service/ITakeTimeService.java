package cn.jeeweb.modules.kiener.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface ITakeTimeService extends ICommonService<TakeTime> {

    public List<TakeTime> selectTakeTimePage(Queryable queryable, Wrapper<TakeTime> wrapper);

    public List<TakeTime> selectAvgTakeTimePage(Queryable queryable, Wrapper<TakeTime> wrapper);

}
