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
@TableName("t_article")
public class ArticleDO {
    @TableId(type = IdType.AUTO)
    private Integer articleId;
    private String title;
    private String cover;
    private String summary;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private boolean isDeleted;
    private int readNum;
}
