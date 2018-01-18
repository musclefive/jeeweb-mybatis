package cn.jeeweb.modules.leave.mapper;

import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.leave.entity.UserLeave;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface UserLeaveMapper extends BaseMapper<UserLeave> {

    List<UserLeave> selectUserLeaveEvent(Queryable queryable, @Param("ew") Wrapper<UserLeave> wrapper);

    List<UserLeave> selectUserLeaveStatics(Queryable queryable, @Param("ew") Wrapper<UserLeave> wrapper);

}
