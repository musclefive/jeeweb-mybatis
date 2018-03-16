package cn.jeeweb.modules.kiener.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import java.util.Map;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
public interface IMeasureDataService extends ICommonService<MeasureData> {

    public List<MeasureData> selectTakeTimePage(Queryable queryable, Wrapper<MeasureData> wrapper);

    public Page<MeasureData> listWithSQL(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryOutput(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryOutputChangeType(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryTaktTime(Queryable queryable, Wrapper<MeasureData> wrapper, Wrapper<MeasureData> wrapper_1);

    public List<MeasureData> querySingleTaktTime(Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryZKGDMC(Queryable queryable, Wrapper<MeasureData> wrapper, Wrapper<MeasureData> wrapper_1);

    public List<MeasureData> queryZKGAndKWDMC(Queryable queryable, Wrapper<MeasureData> wrapper,Wrapper<MeasureData> wrapper_1);

    public List<MeasureData> queryLeakTest(Wrapper<MeasureData> wrapper);

    public List<MeasureData> querySingleDMC(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryDailyDMC(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryDailyDMCforZK(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryEngineList(Queryable queryable, Wrapper<MeasureData> wrapper);

    public List<MeasureData> queryScrweList(Queryable queryable, Wrapper<MeasureData> wrapper);

}
