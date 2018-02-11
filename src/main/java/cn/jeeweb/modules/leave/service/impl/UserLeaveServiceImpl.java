package cn.jeeweb.modules.leave.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.leave.entity.UserLeave;
import cn.jeeweb.modules.leave.mapper.UserLeaveMapper;
import cn.jeeweb.modules.leave.service.IUserLeaveService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Transactional
@Service("userLeaveService")
public class UserLeaveServiceImpl extends CommonServiceImpl<UserLeaveMapper,UserLeave> implements IUserLeaveService{

    public List<UserLeave> selectUserLeave(Queryable queryable, Wrapper<UserLeave> wrapper){
        List<UserLeave> records = baseMapper.selectUserLeaveEvent(queryable, wrapper);
        return records;
    }

    public List<UserLeave> selectUserLeaveStatics(Queryable queryable, Wrapper<UserLeave> wrapper){
        List<UserLeave> records = baseMapper.selectUserLeaveStatics(queryable, wrapper);
        return records;
    }

    public List<UserLeave> selectUserLeaveEventByDepartment(Queryable queryable, Wrapper<UserLeave> wrapper){
        List<UserLeave> records = baseMapper.selectUserLeaveEventByDepartment(queryable, wrapper);
        return records;
    }

    public List<UserLeave> selectUserLeaveStaticsByDepartment(Queryable queryable, Wrapper<UserLeave> wrapper){
        List<UserLeave> records = baseMapper.selectUserLeaveStaticsByDepartment(queryable, wrapper);
        return records;
    }
}
