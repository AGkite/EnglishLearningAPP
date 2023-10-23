package com.howonenew.common.domain.dos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("t_user")
public class UserDO {
    @TableId(type = IdType.AUTO)
    private Integer userId;
    private String username;
    private String password;
    private String email;
    private boolean isDeleted;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
