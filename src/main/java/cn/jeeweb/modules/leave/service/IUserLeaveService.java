package cn.jeeweb.modules.leave.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.leave.entity.UserLeave;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface IUserLeaveService extends ICommonService<UserLeave> {

    public List<UserLeave> selectUserLeave(Queryable queryable, Wrapper<UserLeave> wrapper);

    public List<UserLeave> selectUserLeaveStatics(Queryable queryable, Wrapper<UserLeave> wrapper);

}
