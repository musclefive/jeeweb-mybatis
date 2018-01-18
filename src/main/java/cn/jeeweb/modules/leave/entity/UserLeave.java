package cn.jeeweb.modules.leave.entity;

import cn.jeeweb.core.common.entity.AbstractEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.util.Date;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 * record the employee's vocation, leave, business trip information
 */
@TableName("user_leave")
@SuppressWarnings("serial")
public class UserLeave extends AbstractEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField(value = "Name")
    private String username;

    @TableField(value = "LeaveType")
    private String leavetype;

    @TableField(value = "StartDate")
    private String startdate;

    @TableField(value = "EndDate")
    private String enddate;

    @TableField(value = "Remark")
    private String remark;

    @TableField(value = "LeaveName")
    private String leavename;

    @TableField(value = "User_ID")
    private String userid;

    @TableField(exist = false)
    private String affair;

    @TableField(exist = false)
    private String sick;

    @TableField(exist = false)
    private String paid;

    @TableField(exist = false)
    private String addition;

    @TableField(exist = false)
    private String workover;

    @TableField(exist = false)
    private String overtime;

    @TableField(exist = false)
    private String special;

    @TableField(exist = false)
    private String domestic;

    @TableField(exist = false)
    private String international;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLeavetype() {
        return leavetype;
    }

    public void setLeavetype(String leavetype) {
        this.leavetype = leavetype;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getLeavename() {
        return leavename;
    }

    public void setLeavename(String leavename) {
        this.leavename = leavename;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAffair() {
        return affair;
    }

    public void setAffair(String affair) {
        this.affair = affair;
    }

    public String getSick() {
        return sick;
    }

    public void setSick(String sick) {
        this.sick = sick;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    public String getAddition() {
        return addition;
    }

    public void setAddition(String addition) {
        this.addition = addition;
    }

    public String getWorkover() {
        return workover;
    }

    public void setWorkover(String workover) {
        this.workover = workover;
    }

    public String getOvertime() {
        return overtime;
    }

    public void setOvertime(String overtime) {
        this.overtime = overtime;
    }

    public String getSpecial() {
        return special;
    }

    public void setSpecial(String special) {
        this.special = special;
    }

    public String getDomestic() {
        return domestic;
    }

    public void setDomestic(String domestic) {
        this.domestic = domestic;
    }

    public String getInternational() {
        return international;
    }

    public void setInternational(String international) {
        this.international = international;
    }
}
