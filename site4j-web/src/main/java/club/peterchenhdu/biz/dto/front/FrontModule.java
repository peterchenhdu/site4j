/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.dto.front;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/3/3
 */
public class FrontModule {
    private String name;
    private String key;
    private Boolean supportEditOperation;
    private Boolean supportDelOperation;
    private List<FrontField> fields;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Boolean getSupportEditOperation() {
        return supportEditOperation;
    }

    public void setSupportEditOperation(Boolean supportEditOperation) {
        this.supportEditOperation = supportEditOperation;
    }

    public Boolean getSupportDelOperation() {
        return supportDelOperation;
    }

    public void setSupportDelOperation(Boolean supportDelOperation) {
        this.supportDelOperation = supportDelOperation;
    }

    public List<FrontField> getFields() {
        return fields;
    }

    public void setFields(List<FrontField> fields) {
        this.fields = fields;
    }
}
