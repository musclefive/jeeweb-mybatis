package cn.jeeweb.modules.kiener.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface IMeasureDataService extends ICommonService<MeasureData> {

    public List<MeasureData> selectTakeTimePage(Queryable queryable, Wrapper<MeasureData> wrapper);

    public Page<MeasureData> listWithSQL(Queryable queryable, Wrapper<MeasureData> wrapper);

}
