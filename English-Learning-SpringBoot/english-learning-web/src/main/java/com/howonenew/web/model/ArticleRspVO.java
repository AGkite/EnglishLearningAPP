package com.howonenew.web.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ArticleRspVO {
    private Integer articleId;
    private String title;
    private String cover;
    private String summary;
    private LocalDateTime createTime;
    private int readNum;
    private String content;
}
