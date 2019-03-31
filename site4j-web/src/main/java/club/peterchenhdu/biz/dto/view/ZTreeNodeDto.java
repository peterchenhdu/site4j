/*
 * Copyright © 2018-2025 The Hikvision Company. All Rights Reserved.
 */

package club.peterchenhdu.biz.dto.view;

/**
 * Created by chenpi5 on 2019/3/29.
 */
public class ZTreeNodeDto {

    private String id;
    private String pId;
    private boolean checked;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
