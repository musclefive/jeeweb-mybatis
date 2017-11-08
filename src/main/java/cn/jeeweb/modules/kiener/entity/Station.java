package cn.jeeweb.modules.kiener.entity;

import cn.jeeweb.core.common.entity.AbstractEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.Date;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@TableName("tblStations")
@SuppressWarnings("serial")
public class Station extends AbstractEntity<Long> {

    @TableField(value = "ID")
    private Long id;

    @TableField(value = "Identifier")
    private Integer identifier;

    @TableField(value = "Type")
    private String type;

    @TableField(value = "Address")
    private String address;

    @TableField(value = "IsOffline")
    private String isOffline;

    @TableField(value = "IsALM")
    private Boolean isALM;

    @TableField(value = "IsConveyorSystem")
    private Boolean isConveyorSystem;

    @TableField(value = "IsUpload")
    private Boolean isUpload;

    @TableField(value = "isRework")
    private Boolean isRework;

    @TableField(value = "Enabled")
    private Boolean enabled;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIsOffline() {
        return isOffline;
    }

    public void setIsOffline(String isOffline) {
        this.isOffline = isOffline;
    }

    public Boolean getIsALM() {
        return isALM;
    }

    public void setIsALM(Boolean isALM) {
        this.isALM = isALM;
    }

    public Boolean getIsConveyorSystem() {
        return isConveyorSystem;
    }

    public void setIsConveyorSystem(Boolean isConveyorSystem) {
        this.isConveyorSystem = isConveyorSystem;
    }

    public Boolean getIsUpload() {
        return isUpload;
    }

    public void setIsUpload(Boolean isUpload) {
        this.isUpload = isUpload;
    }

    public Boolean getIsRework() {
        return isRework;
    }

    public void setIsRework(Boolean isRework) {
        this.isRework = isRework;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
