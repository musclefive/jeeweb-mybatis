package cn.jeeweb.modules.kiener.entity;

import cn.jeeweb.core.common.entity.AbstractEntity;
import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@TableName("MeasurementGeneralData")
@SuppressWarnings("serial")
public class MeasureData extends AbstractEntity<Long> {

    @TableField(value = "ID")
    private Long id;

    @TableField(value = "PartNumber")
    private String partNumber;

    @TableField(value = "Station")
    private Integer station;

    @TableField(value = "Variety")
    private String variety;

    @TableField(value = "Date")
    private Date measureDate;

    @TableField(value = "ReworkInStation")
    private Boolean reworkInStation;

    @TableField(value = "ReworkNok")
    private Boolean reworkNok;

    @TableField(value = "ReworkOk")
    private Boolean reworkOk;

    @TableField(value = "Ok")
    private Boolean ok;

    @TableField(value = "Nok")
    private Boolean nOk;

    @TableField(exist = false)
    private Date nextDate;

    @TableField(exist = false)
    private Long takeTime;

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPartNumber() {
        return partNumber;
    }

    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }

    public Integer getStation() {
        return station;
    }

    public void setStation(Integer station) {
        this.station = station;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public Date getMeasureDate() {
        return measureDate;
    }

    public void setMeasureDate(Date measureDate) {
        this.measureDate = measureDate;
    }

    public Boolean getReworkInStation() {
        return reworkInStation;
    }

    public void setReworkInStation(Boolean reworkInStation) {
        this.reworkInStation = reworkInStation;
    }

    public Boolean getReworkNok() {
        return reworkNok;
    }

    public void setReworkNok(Boolean reworkNok) {
        this.reworkNok = reworkNok;
    }

    public Boolean getReworkOk() {
        return reworkOk;
    }

    public void setReworkOk(Boolean reworkOk) {
        this.reworkOk = reworkOk;
    }

    public Boolean getOk() {
        return ok;
    }

    public void setOk(Boolean ok) {
        this.ok = ok;
    }

    public Boolean getnOk() {
        return nOk;
    }

    public void setnOk(Boolean nOk) {
        this.nOk = nOk;
    }

    public Date getNextDate() {
        return nextDate;
    }

    public void setNextDate(Date nextDate) {
        this.nextDate = nextDate;
    }

    public Long getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(Long takeTime) {
        this.takeTime = takeTime;
    }
}
