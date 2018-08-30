package cn.jeeweb.modules.test.db;

import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.leave.entity.UserLeave;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface UserLeaveMapper extends BaseMapper<UserLeave> {

    public UserLeave selectUserByID(String id);

}
