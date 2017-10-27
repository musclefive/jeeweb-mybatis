package cn.jeeweb.modules.kiener.mapper;

import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface TakeTimeMapper extends BaseMapper<TakeTime> {

    List<TakeTime> selectTakeTime(Queryable queryable, @Param("ew") Wrapper<TakeTime> wrapper);

    List<TakeTime> selectAvgTakeTime(Queryable queryable, @Param("ew") Wrapper<TakeTime> wrapper);

    List<TakeTime> selectEngineTypePage(Queryable queryable, @Param("ew") Wrapper<TakeTime> wrapper);

}
