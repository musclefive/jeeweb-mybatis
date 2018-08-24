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

    /*latest Part Number for production*/
    @TableField(exist = false)
    private Integer changeCount;

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

    /*screw information begin*/
    @TableField(exist = false)
    private String scewID;

    @TableField(exist = false)
    private String spinID;

    @TableField(exist = false)
    private String screwpos;

    @TableField(exist = false)
    private String torqueMin;

    @TableField(exist = false)
    private String torqueMax;

    @TableField(exist = false)
    private String torqueAct;

    @TableField(exist = false)
    private String angleMin;

    @TableField(exist = false)
    private String angleMax;

    @TableField(exist = false)
    private String angleAct;
    /*screw information end*/

    /*force information begin*/
    @TableField(exist = false)
    private String forceID;

    @TableField(exist = false)
    private String strokeNumber;

    @TableField(exist = false)
    private String hardware;

    @TableField(exist = false)
    private String forceMin;

    @TableField(exist = false)
    private String forceMax;

    @TableField(exist = false)
    private String forceAct;

    @TableField(exist = false)
    private String distMin;

    @TableField(exist = false)
    private String distMax;

    @TableField(exist = false)
    private String distAct;
    /*screw information end*/

    /*ratio for success past engine information end*/
    @TableField(exist = false)
    private String totalNok;

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

    public Integer getChangeCount() {
        return changeCount;
    }

    public void setChangeCount(Integer changeCount) {
        this.changeCount = changeCount;
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


    public String getScewID() {
        return scewID;
    }

    public void setScewID(String scewID) {
        this.scewID = scewID;
    }

    public String getSpinID() {
        return spinID;
    }

    public void setSpinID(String spinID) {
        this.spinID = spinID;
    }

    public String getScrewpos() {
        return screwpos;
    }

    public void setScrewpos(String screwpos) {
        this.screwpos = screwpos;
    }

    public String getTorqueMin() {
        return torqueMin;
    }

    public void setTorqueMin(String torqueMin) {
        this.torqueMin = torqueMin;
    }

    public String getTorqueMax() {
        return torqueMax;
    }

    public void setTorqueMax(String torqueMax) {
        this.torqueMax = torqueMax;
    }

    public String getTorqueAct() {
        return torqueAct;
    }

    public void setTorqueAct(String torqueAct) {
        this.torqueAct = torqueAct;
    }

    public String getAngleMin() {
        return angleMin;
    }

    public void setAngleMin(String angleMin) {
        this.angleMin = angleMin;
    }

    public String getAngleMax() {
        return angleMax;
    }

    public void setAngleMax(String angleMax) {
        this.angleMax = angleMax;
    }

    public String getAngleAct() {
        return angleAct;
    }

    public void setAngleAct(String angleAct) {
        this.angleAct = angleAct;
    }

    public String getTotalNok() {
        return totalNok;
    }

    public void setTotalNok(String totalNok) {
        this.totalNok = totalNok;
    }

    public String getForceID() {
        return forceID;
    }

    public void setForceID(String forceID) {
        this.forceID = forceID;
    }

    public String getStrokeNumber() {
        return strokeNumber;
    }

    public void setStrokeNumber(String strokeNumber) {
        this.strokeNumber = strokeNumber;
    }

    public String getHardware() {
        return hardware;
    }

    public void setHardware(String hardware) {
        this.hardware = hardware;
    }

    public String getForceMin() {
        return forceMin;
    }

    public void setForceMin(String forceMin) {
        this.forceMin = forceMin;
    }

    public String getForceMax() {
        return forceMax;
    }

    public void setForceMax(String forceMax) {
        this.forceMax = forceMax;
    }

    public String getForceAct() {
        return forceAct;
    }

    public void setForceAct(String forceAct) {
        this.forceAct = forceAct;
    }

    public String getDistMin() {
        return distMin;
    }

    public void setDistMin(String distMin) {
        this.distMin = distMin;
    }

    public String getDistMax() {
        return distMax;
    }

    public void setDistMax(String distMax) {
        this.distMax = distMax;
    }

    public String getDistAct() {
        return distAct;
    }

    public void setDistAct(String distAct) {
        this.distAct = distAct;
    }
}
