package cn.jeeweb.modules.kiener.mapper;

import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface MeasureDataMapper extends BaseMapper<MeasureData> {

    List<MeasureData> selectTakeTime(Queryable queryable, @Param("ew") Wrapper<MeasureData> wrapper);

    List<MeasureData> selectTakeTimePage(Page<MeasureData> page, @Param("ew") Wrapper<MeasureData> wrapper);


}
