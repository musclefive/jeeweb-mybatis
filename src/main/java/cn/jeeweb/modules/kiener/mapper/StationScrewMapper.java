package cn.jeeweb.modules.kiener.mapper;

import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.StationScrew;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface StationScrewMapper extends BaseMapper<StationScrew> {

    List<StationScrew> selectScrewStation(Queryable queryable, @Param("ew") Wrapper<StationScrew> wrapper);

}
