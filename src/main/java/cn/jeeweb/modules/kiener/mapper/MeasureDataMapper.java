package cn.jeeweb.modules.kiener.mapper;

import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface MeasureDataMapper extends BaseMapper<MeasureData> {

    List<MeasureData> selectTakeTime(Queryable queryable, @Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> selectTakeTimePage(Page<MeasureData> page, @Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryRealTimeOutput(Queryable queryable, @Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryRealTimeOutputChangeType(Queryable queryable, @Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryRealTimeTaktTime(Queryable queryable, @Param("ew") Wrapper<MeasureData> wrapper, @Param("ew_1") Wrapper<MeasureData> wrapper_1);

    List<MeasureData> queryRealTimeTaktTimeSingle(@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryGroupData(@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryZKGDMCbm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper ,@Param("ew_1") Wrapper<MeasureData> wrapper_1);

    List<MeasureData> queryZKAndKWDMCbm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper, @Param("ew_1") Wrapper<MeasureData> wrapper_1);

    List<MeasureData> queryLeasTestbm(@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryScrewListbm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryForceListbm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> querySingleDMCbm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryDailyDMCbm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryDailyDMCbmforZK(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryEngineList(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryOKRatebm(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> queryOKRatebmwithNoVariety(Queryable queryable,@Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> selectEngineTypePage(Queryable queryable, @Param("ew") Wrapper<MeasureData> wrapper);

}
