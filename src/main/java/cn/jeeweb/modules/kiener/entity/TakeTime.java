package cn.jeeweb.modules.kiener.entity;

import cn.jeeweb.core.common.entity.AbstractEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.Date;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@TableName("MeasureDataTakeTime")
@SuppressWarnings("serial")
public class TakeTime extends AbstractEntity<Long> {

    @TableField(value = "id")
    private Long id;

    @TableField(value = "partNumber")
    private String partNumber;

    @TableField(value = "station")
    private Integer station;

    @TableField(value = "currentType")
    private String currentType;

    @TableField(value = "nextType")
    private String nextType;


    @TableField(value = "measureDate")
    private Date measureDate;

    @TableField(value = "endDate")
    private Date endDate;

    @TableField(value = "takeTime")
    private String takeTime;

    @TableField(value = "changeType")
    private Long changeType;

    /*output for query*/
    @TableField(exist = false)
    private String avgTakTime;

    /*worker ID for query*/
    @TableField(exist = false)
    private String workerID;

    /*total count for worker ID for query*/
    @TableField(exist = false)
    private String total;

    @Override
    public Long getId() {
        return id;
    }

    @Override
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

    public String getCurrentType() {
        return currentType;
    }

    public void setCurrentType(String currentType) {
        this.currentType = currentType;
    }

    public String getNextType() {
        return nextType;
    }

    public void setNextType(String nextType) {
        this.nextType = nextType;
    }

    public Date getMeasureDate() {
        return measureDate;
    }

    public void setMeasureDate(Date measureDate) {
        this.measureDate = measureDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(String takeTime) {
        this.takeTime = takeTime;
    }

    public Long getChangeType() {
        return changeType;
    }

    public void setChangeType(Long changeType) {
        this.changeType = changeType;
    }

    public String getAvgTakTime() {
        return avgTakTime;
    }

    public void setAvgTakTime(String avgTakTime) {
        this.avgTakTime = avgTakTime;
    }

    public String getWorkerID() {
        return workerID;
    }

    public void setWorkerID(String workerID) {
        this.workerID = workerID;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}
