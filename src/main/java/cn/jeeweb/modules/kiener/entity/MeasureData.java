package cn.jeeweb.modules.kiener.entity;

import cn.jeeweb.core.common.entity.AbstractEntity;
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

    /*output for production*/
    @TableField(exist = false)
    private String output;

    /*real time takt for rowId*/
    @TableField(exist = false)
    private String rowId;

    /*latest Part Number for production*/
    @TableField(exist = false)
    private String latestNumber;

    /*old dmc code for ZKG*/
    @TableField(exist = false)
    private String dmc;

    /*new dmc code for ZKG*/
    @TableField(exist = false)
    private String dmcNew;

    /*sum count for ZKG*/
    @TableField(exist = false)
    private String summary;

    /*maxDate code for ZKG*/
    @TableField(exist = false)
    private String maxDate;

    /*type zkg zk kw code for ZKG*/
    @TableField(exist = false)
    private String type;

    /*total zkg zk kw code for ZKG*/
    @TableField(exist = false)
    private String total;

    /*new dmc code for ZKG*/
    @TableField(exist = false)
    private String leakID;

    /*old dmc code for ZKG*/
    @TableField(exist = false)
    private String pressure;

    /*new dmc code for ZKG*/
    @TableField(exist = false)
    private String leakRate;

    /*new dmc code for ZKG*/
    @TableField(exist = false)
    private String checkProg;


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

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    public String getLatestNumber() {
        return latestNumber;
    }

    public void setLatestNumber(String latestNumber) {
        this.latestNumber = latestNumber;
    }

    public String getDmc() {
        return dmc;
    }

    public void setDmc(String dmc) {
        this.dmc = dmc;
    }

    public String getDmcNew() {
        return dmcNew;
    }

    public void setDmcNew(String dmcNew) {
        this.dmcNew = dmcNew;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getMaxDate() {
        return maxDate;
    }

    public void setMaxDate(String maxDate) {
        this.maxDate = maxDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getLeakID() {
        return leakID;
    }

    public void setLeakID(String leakID) {
        this.leakID = leakID;
    }

    public String getPressure() {
        return pressure;
    }

    public void setPressure(String pressure) {
        this.pressure = pressure;
    }

    public String getLeakRate() {
        return leakRate;
    }

    public void setLeakRate(String leakRate) {
        this.leakRate = leakRate;
    }

    public String getCheckProg() {
        return checkProg;
    }

    public void setCheckProg(String checkProg) {
        this.checkProg = checkProg;
    }
}
