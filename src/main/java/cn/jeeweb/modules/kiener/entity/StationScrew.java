package cn.jeeweb.modules.kiener.entity;

import cn.jeeweb.core.common.entity.AbstractEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@TableName("tblStationScrew")
@SuppressWarnings("serial")
public class StationScrew extends AbstractEntity<String> {

    @TableId(value = "ID", type = IdType.UUID)
    private String id;

    @TableField(value = "Identifier")
    private Integer identifier;

    @TableField(value = "Type")
    private String type;

    @TableField(value = "Pos")
    private String pos;

    @TableField(value = "Spin")
    private String spin;

    @TableField(value = "MeasureType")
    private String measuretype;

    @TableField(value = "JobID")
    private String jobid;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public Integer getIdentifier() {
        return identifier;
    }

    public void setIdentifier(Integer identifier) {
        this.identifier = identifier;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public String getSpin() {
        return spin;
    }

    public void setSpin(String spin) {
        this.spin = spin;
    }

    public String getMeasuretype() {
        return measuretype;
    }

    public void setMeasuretype(String measuretype) {
        this.measuretype = measuretype;
    }

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
        this.jobid = jobid;
    }
}
